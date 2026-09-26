#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

# リポジトリ側の TOML にあるトップレベルの key = value 行を、実ファイル側の同名の行と置き換える(無ければ先頭に足す)。
# 実ファイル側のそれ以外の行(テーブルを含む)はそのまま残す。内容が変わらないときは書き込まない。
# $1: リポジトリ側  $2: 実ファイル
merge_toml_top_level() {
  src=$1; dst=$2
  if grep -q '^[[:space:]]*\[' "$src"; then
    echo "merge_toml_top_level: $src にテーブル([...])があるが、流し込めるのはトップレベルの key = value 行だけ" >&2
    return 1
  fi
  if [ -L "$dst" ]; then
    # 以前はリポジトリへのリンクだった。リンク先の内容(アプリが書いた状態を含む)を実ファイルへ移す
    cp -L "$dst" "$dst.tmp" && rm "$dst" && mv "$dst.tmp" "$dst"
  fi
  [ -e "$dst" ] || : > "$dst"
  cp -p "$dst" "$dst.tmp"
  awk '
    FNR == NR {
      if ($0 ~ /^[A-Za-z0-9_.-]+[[:space:]]*=/) { key = $0; sub(/[[:space:]]*=.*/, "", key); keys[key] = 1; lines[++n] = $0 }
      next
    }
    !printed { for (i = 1; i <= n; i++) print lines[i]; printed = 1 }
    !intable && /^[[:space:]]*\[/ { intable = 1 }
    !intable && /^[A-Za-z0-9_.-]+[[:space:]]*=/ { key = $0; sub(/[[:space:]]*=.*/, "", key); if (key in keys) next }
    { print }
    END { if (!printed) for (i = 1; i <= n; i++) print lines[i] }
  ' "$src" "$dst" > "$dst.tmp"
  if cmp -s "$dst.tmp" "$dst"; then
    rm "$dst.tmp"
  else
    mv "$dst.tmp" "$dst"
    echo "merge: $src -> $dst"
  fi
}

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
# config.toml はリンクにしない。Codex と ChatGPT アプリが、信頼したディレクトリ・プラグインのキャッシュ位置・
# MCP の配線・フックの信頼ハッシュなど、この Mac 固有の状態を同じファイルに書き戻すため。
# 実ファイルを Codex に持たせ、リポジトリ側の手書きの設定だけを流し込む。Codex アプリを終了した状態で実行すること。
merge_toml_top_level "${BASE_DIR}/Codex/config.toml" "${HOME}/.codex/config.toml"

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
