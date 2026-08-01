#!/bin/bash
# Claude Code の subagentStatusLine 用。エージェント1行ごとの装飾を返す。
#
# stdin : {"columns":N,"tasks":[{id,name,type,status,description,label,startTime,
#          model,effort,contextWindowSize,tokenCount,tokenSamples,cwd},...]}
#         type は local_agent / local_bash / local_workflow / remote_agent / in_process_teammate
#         tokenSamples は直近16サンプル（5秒間隔＝約80秒）のトークン数の履歴
# stdout: タスク1件につき1行の JSON {"id":"...","content":"..."}
#
# 5秒ごとに再実行される（タイムアウト5秒）ので軽量に保つ。
# 出力: 🌒 🧠opus ▁▁▃▃▅▇█ 12.4k 1m23s
#   月フェーズ = 経過秒数から算出。ティックごとに満ちていくので「生きている」印になる。

export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"  # jq を確実に引く

# 届いた JSON を見たいときは `touch ~/.claude/.subagent-statusline-debug`
if [ -e "${HOME}/.claude/.subagent-statusline-debug" ]; then
  tee "${HOME}/.claude/subagent-statusline-last.json"
else
  cat
fi |

jq -c --argjson now "$(date +%s)" '
  def spark:
    ["▁","▂","▃","▄","▅","▆","▇","█"] as $b
    | if (length // 0) < 2 then ""
      else (max) as $hi | (min) as $lo
      | map($b[ if $hi > $lo then ((((. - $lo) * 7) / ($hi - $lo)) | floor) else 0 end ]) | join("")
      end;
  def dur($s): if $s < 60 then "\($s)s" else "\((($s / 60) | floor))m\(($s % 60))s" end;
  def moon($s): ["🌑","🌒","🌓","🌔","🌕","🌖","🌗","🌘"] as $m | $m[((($s / 5) | floor) % 8)];
  def tok: if . >= 1000 then "\((((. / 100) | floor) / 10))k" else "\(.)" end;
  def badge:
    (. // "?") | ascii_downcase
    | if   test("fable")  then "✨fable"
      elif test("opus")   then "🧠opus"
      elif test("sonnet") then "⚡sonnet"
      elif test("haiku")  then "🐣haiku"
      else "🤖\(.)" end;

  .tasks[]
  | ((($now - ((.startTime // ($now * 1000)) / 1000)) | floor) | if . < 0 then 0 else . end) as $el
  | { id: .id,
      content: ([ (if .status == "running" then moon($el) else "✅" end),
                  (if .model then (.model | badge) else null end),  # local_bash 等は model 無し
                  (.tokenSamples // [] | spark),
                  (if (.tokenCount // 0) > 0 then (.tokenCount | tok) else null end),
                  dur($el),
                  # content は行の名前・経過時間欄を「置き換える」ので、識別子は自分で出す。
                  # 長くて切られやすいものを末尾に置き、固定長の指標を先に出す。
                  ("· " + (.name // .label // .description // .type // "agent"))
                ] | map(select(. != "" and . != null)) | join(" "))
    }
'
