#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sf "${BASE_DIR}/bash_profile"               "${HOME}/.bash_profile"
ln -sf "${BASE_DIR}/bashrc"                     "${HOME}/.bashrc"
ln -sf "${BASE_DIR}/tmux.conf"                  "${HOME}/.tmux.conf"
ln -sf "${BASE_DIR}/vimshrc"                    "${HOME}/.vimshrc"
ln -sf "${BASE_DIR}/xvimrc"                     "${HOME}/.xvimrc"
ln -sf "${BASE_DIR}/IntelliJ_IDEA/ideavimrc"    "${HOME}/.ideavimrc"
ln -sf "${BASE_DIR}/zshrc"                      "${HOME}/.zshrc"
ln -sf "${BASE_DIR}/blockdiagrc"                "${HOME}/.blockdiagrc"
ln -sf "${BASE_DIR}/vscode/settings.json"       "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sf "${BASE_DIR}/shrc.d"                     "${HOME}/shrc.d"

${BASE_DIR}/vim/link.sh
