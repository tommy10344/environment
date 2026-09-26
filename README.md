# environment

個人の開発環境。macOS が中心で、Windows 用の最小限のセットアップも含む。

## macOS

### 新しいマシンのセットアップ

1. Xcode と Command Line Tools を入れる
2. このリポジトリをクローンする

   ```sh
   git clone https://github.com/tommy10344/environment
   ```

3. セットアップスクリプトを流す

   ```sh
   cd environment
   bash setup.sh
   ```

`setup.sh` は名前とメールアドレスを聞いたあと、次の順に進む。

- SSH 鍵の作成(無い場合のみ)
- 設定ファイルの配置(`dotfiles/link.sh`)
- macOS の設定(`setup_defaults.sh`)
- Homebrew と CLI ツール、Ruby(rbenv)、Node.js(volta)、Vim / Neovim、Swift / iOS / Flutter まわり
- Claude Code 本体とプラグイン
- アプリ(`brew bundle` で `dotfiles/Brewfile-cask`)
- sdkman と Java、safe-chain、VS Code の設定(`dotfiles/vscode/setup.sh`)

### 設定ファイルの配置

```sh
./link.sh
```

`dotfiles/link.sh`(設定ファイル)と `bin/link.sh`(`~/bin`)を続けて流す。どちらも `ln -sfn` なので何度流してもよい。

- リンクはクローン先の絶対パスを指す。リポジトリを移動したら流し直す。
- `dotfiles/link.sh` は最後に、このリポジトリ内を指していて指す先がもう無いリンクを外し、`unlink: ...` と表示する。実ファイルや、リポジトリ外を指すリンクには触らない。
- 例外は Codex の `~/.codex/config.toml`。Codex と ChatGPT アプリが、信頼したディレクトリやプラグインのキャッシュ位置などこの Mac 固有の状態を同じファイルに書き戻すため、リンクにせず実ファイルとして Codex に持たせる。`link.sh` は `dotfiles/Codex/config.toml` にあるトップレベルの `key = value` 行だけをその実ファイルへ流し込む(`merge: ...` と表示)。書けるのはトップレベルの行だけで、テーブル(`[...]`)は書けない。Codex アプリを終了した状態で流す。

設定を追加・削除するとき:

- 追加: ファイルを置き、`dotfiles/link.sh` に `ln -sfn` の行を足して流す。新しいディレクトリへ張る場合は、同じファイルの末尾にある `prune_stale_links` の一覧にもそのディレクトリを足す。
- 削除: ファイルと `ln -sfn` の行を消して流す。HOME 側のリンクは自動で外れる。他のマシンでも pull して流せば外れる。

### 日々の更新

```sh
all-update
```

Homebrew、npm のグローバルパッケージ、gem、Neovim のプラグイン、Flutter などをまとめて更新する(`bin/bin/all-update`)。

## Windows

PowerShell で実行する。Windows PowerShell 5.1 と PowerShell 7 では `$PROFILE` が別のファイルなので、普段使う側で流す。

| スクリプト | 内容 |
|---|---|
| `windows/setup.ps1` | WSL と、winget で入れるアプリ |
| `windows/setup_starship.ps1` | フォントと starship を入れ、`link.ps1` を呼ぶ |
| `windows/link.ps1` | `$PROFILE` に `windows/profile.ps1` を読み込む 1 行を書く |
| `windows/profile.ps1` | PowerShell のプロファイル本体 |

`link.ps1` はシンボリックリンクを作らないので、管理者権限も開発者モードも要らない。何度流してもよく、リポジトリを移動したら流し直す。以後は `profile.ps1` を編集して pull するだけで反映される。

スクリプトの実行が拒否される場合:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## 構成

| パス | 内容 |
|---|---|
| `setup.sh` | macOS の新規セットアップ |
| `setup_defaults.sh` | macOS の `defaults` 設定 |
| `link.sh` | `dotfiles/link.sh` と `bin/link.sh` を流す |
| `bin/bin/` | `~/bin` としてリンクされる自作スクリプト |
| `dotfiles/zshrc` `zprofile` `shrc` `shrc.d/` | zsh の設定。`shrc` が `shrc.d/` の各ファイルを読み込む |
| `dotfiles/vim/` | Vim / Neovim の設定(vim-plug、coc.nvim) |
| `dotfiles/ClaudeCode/` `dotfiles/Codex/` | Claude Code と Codex の設定 |
| `dotfiles/vscode/` `iterm2/` `yazi/` `Xcode/` `IntelliJ_IDEA/` `Raycast/` `gemrc` | 各アプリ・ツールの設定 |
| `dotfiles/Brewfile-cask` | `brew bundle` で入れるアプリ |
| `windows/` | Windows 用のセットアップとプロファイル |
