#!/usr/bin/env bash
# Claude Code の UserPromptSubmit フック。
# Claude Code が生成する内容由来のタイトル（ai-title）をセッション名に取り込み、
# /resume から後で追えるようにする。タブに出ている名前と一致する。
#
# ai-title は最初のやり取りの後に生成されるため、名前が付くのは 2 回目のプロンプト以降。
# sessionTitle を返せるのは SessionStart と UserPromptSubmit だけで、SessionStart の時点では
# まだ ai-title が無いので、これが最速のタイミング。
#
# claude --name や /rename で名前が付いているセッションには何もしない。
set -u

input=$(cat)

# jq が無ければ何もしない（フックの失敗でプロンプト送信を妨げないため）
command -v jq >/dev/null 2>&1 || { echo '{}'; exit 0; }

json() { printf '%s' "$input" | jq -r "$1 // \"\""; }

# サブエージェント／チームメイトのセッションは対象外
[ -z "$(json .agent_type)" ] || { echo '{}'; exit 0; }

# 既に名前が付いていれば尊重する。hook が設定した名前も次回以降ここに載るので、
# 一度付けば以降は transcript を読まずに抜ける。
[ -z "$(json .session_title)" ] || { echo '{}'; exit 0; }

transcript=$(json .transcript_path)
[ -n "$transcript" ] && [ -r "$transcript" ] || { echo '{}'; exit 0; }

title=$(grep '"type":"ai-title"' "$transcript" | tail -1 | jq -r '.aiTitle // empty')

# 未生成のときのプレースホルダは使わない
case "$title" in
  '' | 'Session title unknown') echo '{}'; exit 0 ;;
esac

jq -n --arg title "$title" '{
  hookSpecificOutput: {
    hookEventName: "UserPromptSubmit",
    sessionTitle: $title
  }
}'
