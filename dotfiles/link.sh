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
ln -sfn "${BASE_DIR}/Codex/config.toml"          "${HOME}/.codex/config.toml"
ln -sfn "${BASE_DIR}/Codex/AGENTS.md"            "${HOME}/.codex/AGENTS.md"

mkdir -p "${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
ln -sfn "${BASE_DIR}/iterm2/DynamicProfiles.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/DynamicProfiles.json"

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
prune_stale_links "${HOME}/Library/Developer/Xcode/UserData"                    1
