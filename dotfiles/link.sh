#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sfn "${BASE_DIR}/bash_profile"               "${HOME}/.bash_profile"
ln -sfn "${BASE_DIR}/bashrc"                     "${HOME}/.bashrc"
ln -sfn "${BASE_DIR}/tmux.conf"                  "${HOME}/.tmux.conf"
ln -sfn "${BASE_DIR}/vimshrc"                    "${HOME}/.vimshrc"
ln -sfn "${BASE_DIR}/xvimrc"                     "${HOME}/.xvimrc"
ln -sfn "${BASE_DIR}/IntelliJ_IDEA/ideavimrc"    "${HOME}/.ideavimrc"
ln -sfn "${BASE_DIR}/zshrc"                      "${HOME}/.zshrc"
ln -sfn "${BASE_DIR}/blockdiagrc"                "${HOME}/.blockdiagrc"
ln -sfn "${BASE_DIR}/vscode/settings.json"       "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sfn "${BASE_DIR}/shrc.d"                     "${HOME}/shrc.d"
ln -sfn "${BASE_DIR}/karabiner"                  "${HOME}/.config"
ln -sfn "${BASE_DIR}/hyper.js"                   "${HOME}/.hyper.js"

${BASE_DIR}/vim/link.sh
