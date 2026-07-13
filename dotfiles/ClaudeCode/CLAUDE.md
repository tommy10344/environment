Think in English, interact with the user in Japanese.

# Git commit

- コミットメッセージに `Co-Authored-By: Claude ...` の行を**絶対に含めないこと**。
- 同様に、コミットメッセージ末尾の `🤖 Generated with Claude Code` のような署名・宣伝文も含めない。
- コミットメッセージは日本語で記述する（既存のリポジトリ慣習に従う）。

# Pull request

- PR の本文に `🤖 Generated with [Claude Code](...)` のような署名・宣伝文を含めない。

# モデル運用（Fable はオーケストレーション専任）

メインループが Fable のセッションでは、Fable は自分で手を動かさず**オーケストレーションに徹する**。

- **Fable の役割**: タスク分解・計画、subagent への指示出し、成果の検証・統合、ユーザーとの対話、コミット等の最終判断。
- **作業は subagent へ移譲する**: 探索・大量読解、実装・編集・テスト実行、ドラフト執筆、出力の長いコマンドの実行と要約。独立した作業は複数 subagent を並列で出す。
- **Agent / Workflow の呼び出しでは `model` を必ず明示する**（無指定は親 = Fable を継承してしまい高コスト。例外: 下記カスタム agent は frontmatter の既定 model が効くので省略可）:
  - `haiku` = 機械的な列挙・抽出・整形
  - `sonnet` = 既定（実装・調査・執筆・定型的な検証）
  - `opus` = 高度な判断を要する検証・レビュー・設計判断の難所
  - `fable` = opus でも足りないと分かっている最難関のみ（例外扱い・既定では使わない）
- **Fable が直接やってよい例外**: 次の指示や検証のためのピンポイントな Read／grep、移譲のオーバーヘッドが作業より明らかに大きい数行規模の微修正。

## subagent 運用（メインループのモデルによらず共通）

カスタム agent 定義 = `~/.claude/agents/`: `verifier`（読み取り専用の検証係・既定 sonnet）／`impl`（実装係・sonnet）／`extract`（機械抽出係・haiku）。

- **読むだけの作業に Edit/Write を持たせない**: 探索は Explore、検証・裏どり・レビューは `verifier`（難所は呼び出し時に `model: opus` へ昇格）。検証 agent に編集権があると勝手に編集して不整合を作る。編集を伴う実装のみ `impl` / general-purpose。
- **移譲プロンプトは自己完結で書く**: subagent は会話履歴を一切見ていない。背景・対象パス・期待する出力形式（結論＋file:line＋原文引用）・やらないこと（編集禁止／スコープ外に踏み込まない）を毎回明記する。
- **報告は鵜呑みにしない**: 結論に効く主張（file:line・仕様値など）は親が実物を開いて裏どりしてから採用する。
- **Workflow の schema 強制×重い調査は 1 claim / 1 agent に分割する**（多 claim だと StructuredOutput 未呼出を量産する）。
