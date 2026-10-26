#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sfn "${BASE_DIR}/IntelliJ_IDEA/ideavimrc"    "${HOME}/.ideavimrc"
ln -sfn "${BASE_DIR}/zshrc"                      "${HOME}/.zshrc"
ln -sfn "${BASE_DIR}/zprofile"                   "${HOME}/.zprofile"
ln -sfn "${BASE_DIR}/shrc"                       "${HOME}/.shrc"
ln -sfn "${BASE_DIR}/gemrc"                      "${HOME}/.gemrc"
ln -sfn "${BASE_DIR}/vscode/settings.json"       "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sfn "${BASE_DIR}/vscode/markdown-github.css" "${HOME}/.config/vscode-markdown-github.css"
ln -sfn "${BASE_DIR}/shrc.d"                     "${HOME}/shrc.d"
ln -sfn "${BASE_DIR}/Xcode/CodeSnippets"         "${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"

mkdir -p "${HOME}/.config/yazi"
ln -sfn "${BASE_DIR}/yazi/theme.toml"            "${HOME}/.config/yazi/theme.toml"

mkdir -p "${HOME}/.claude"
ln -sfn "${BASE_DIR}/ClaudeCode/settings.json"   "${HOME}/.claude/settings.json"
ln -sfn "${BASE_DIR}/ClaudeCode/agents"          "${HOME}/.claude/agents"
ln -sfn "${BASE_DIR}/ClaudeCode/CLAUDE.md"       "${HOME}/.claude/CLAUDE.md"
ln -sfn "${BASE_DIR}/ClaudeCode/themes"          "${HOME}/.claude/themes"
ln -sfn "${BASE_DIR}/ClaudeCode/hooks"           "${HOME}/.claude/hooks"

mkdir -p "${HOME}/.codex"
ln -sfn "${BASE_DIR}/Codex/AGENTS.md"            "${HOME}/.codex/AGENTS.md"
# config.toml は ~/.codex ではなく、Codex がシステム設定として読む /etc/codex/config.toml へ張る。
# ~/.codex/config.toml には Codex と ChatGPT アプリが、信頼したディレクトリ・プラグインのキャッシュ位置・MCP の配線など
# この Mac 固有の状態を書き戻すので、実ファイルのままアプリに任せる。システム設定はそれより優先度が低く、
# 同じキーが ~/.codex/config.toml にあればそちらが勝つ(アプリでモデルを選ぶと model が書き戻される)。
# /etc は root の持ち物なので、リンクが張られていないときだけ sudo で張る。
if [ "$(readlink /etc/codex/config.toml)" != "${BASE_DIR}/Codex/config.toml" ]; then
  sudo mkdir -p /etc/codex && sudo ln -sfn "${BASE_DIR}/Codex/config.toml" /etc/codex/config.toml
fi

mkdir -p "${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
ln -sfn "${BASE_DIR}/iterm2/DynamicProfiles.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/DynamicProfiles.json"

# Ghostty は ~/.config/ghostty も読むが、macOS ではこちらが後に読まれて優先されるので、こちらへ張る
mkdir -p "${HOME}/Library/Application Support/com.mitchellh.ghostty"
ln -sfn "${BASE_DIR}/ghostty/config.ghostty"     "${HOME}/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

${BASE_DIR}/vim/link.sh

# ----- 残骸リンクの掃除 -----
# ln -sfn は張るだけなので、リポジトリからファイルと上の ln 行を消しても HOME 側のリンクは残り続ける。
# このリポジトリ内を指していて、指す先がもう存在しないリンクだけを外す(実ファイルや、リポジトリ外を指すリンクには触らない)。
# リンク先のディレクトリを増やしたらここにも足す。ln 行を消すときも、他のマシンで外し終わるまでここには残す。
REPO_DIR=$(cd "${BASE_DIR}/.." && pwd)
prune_stale_links() {
  # $1: 探すディレクトリ  $2: 探す深さ
  [ -d "$1" ] || return 0
  find "$1" -maxdepth "$2" -type l -lname "${REPO_DIR}/*" ! -exec test -e {} \; \
    -exec sh -c 'echo "unlink: $1 -> $(readlink "$1")"; rm "$1"' _ {} \;
}
prune_stale_links "${HOME}"                                                     1
prune_stale_links "${HOME}/.config"                                             2
prune_stale_links "${HOME}/.claude"                                             1
prune_stale_links "${HOME}/.codex"                                              1
prune_stale_links "${HOME}/.vim"                                                1
prune_stale_links "${HOME}/Library/Services"                                    1
prune_stale_links "${HOME}/Library/Application Support/Code/User"               1
prune_stale_links "${HOME}/Library/Application Support/iTerm2/DynamicProfiles"  1
prune_stale_links "${HOME}/Library/Application Support/com.mitchellh.ghostty"   1
prune_stale_links "${HOME}/Library/Developer/Xcode/UserData"                    1
