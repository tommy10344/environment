Interact with the user in Japanese.

# 別系統のモデルでのレビュー（Claude）

GPT 系どうしのレビューは見落としの傾向が重なりやすい。まとまった実装や PR 前の最終確認、設計判断の難所では、仕上げる前に Claude Code にもレビューさせる。数行の修正や設定変更には使わない（数分かかり、ノイズの裏どりが割に合わない）。

```sh
git diff main...HEAD | claude -p --agent verifier --model opus \
  --tools "Read,Grep,Glob" --permission-mode dontAsk --no-session-persistence \
  --strict-mcp-config --settings '{"disableAllHooks":true}' \
  "<レビュー指示>"
```

- `--agent verifier`: `~/.claude/agents/verifier.md` の検証係として動かす（疑ってかかる、file:line と原文引用を添える、確かめられないものは「未確認」と書く）。
- `--tools "Read,Grep,Glob"`: 組み込みのツールを読み取りだけに絞る。Bash も渡さないので、Claude はファイルの変更もコマンドの実行もできない。diff は標準入力で渡す（プロンプトの後ろに付く）。
- `--strict-mcp-config`: MCP のツールを外す。`--tools` は組み込みのツールしか絞らず、これがないと claude.ai のコネクタ（Outlook の送信など）が残る。
- `--settings '{"disableAllHooks":true}'`: Claude Code のフックを止める。フックは `--tools` の制限の外でコマンドを実行し、`settings.json` の iTerm2 の `cc-status` はこのタブの表示を Claude の状態に書き換えうる。
- `--permission-mode dontAsk`: 許可されていない操作は確認せずに拒否する。非対話なので、確認待ちで止まらないようにする。
- `--model opus`: 既定。最重要の成果物の最終確認なら `fable` にする。
- `--no-session-persistence`: レビューのたびに Claude のセッションを残さない。

実行するとき:

- claude は API に接続し `~/.claude` に書き込むので、サンドボックスの中では動かない。サンドボックスの外での実行の承認を求めてから実行する。
- 数分かかることがあるので、コマンドのタイムアウトを長めにとる。
- レビュー指示は自己完結で書く（Claude は会話を見ていない）。変更の意図、見てほしい観点（正しさのバグ・意図との食い違い・エッジケース。命名や書き方の好みは不要）、出力形式（指摘ごとに file:line・何が起きるか・根拠）を毎回書く。
- Claude の指摘は鵜呑みにしない。結論に効く指摘は実物を開いて確かめてから直す。
- claude が使えないとき（未インストール・未ログイン）は、その旨をユーザーに伝える。
