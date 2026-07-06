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
- **作業は subagent へ移譲する**: 探索・大量読解（Explore 型）、実装・編集・テスト実行、ドラフト執筆、出力の長いコマンドの実行と要約。独立した作業は複数 subagent を並列で出す。
- **Agent / Workflow の呼び出しでは `model` を必ず明示する**（無指定は親 = Fable を継承してしまい高コスト）:
  - 既定 = `sonnet`（実装・調査・執筆）
  - 機械的な列挙・抽出・整形 = `haiku`
  - 高度な判断を要する検証・レビューの難所のみ = `fable`
- **Fable が直接やってよい例外**: 次の指示や検証のためのピンポイントな Read／grep、移譲のオーバーヘッドが作業より明らかに大きい数行規模の微修正。
- subagent の報告は鵜呑みにしない。結論に効く主張（file:line・仕様値など）は Fable が実物を開いて裏どりしてから採用する。
