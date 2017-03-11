#!/bin/sh

DIR_PATH=`dirname $0`

diff -u ${DIR_PATH}/.bash_profile ~/.bash_profile
diff -u ${DIR_PATH}/.bashrc       ~/.bashrc
diff -u ${DIR_PATH}/.gvimrc       ~/.gvimrc
diff -u ${DIR_PATH}/.tmux.conf    ~/.tmux.conf
diff -u ${DIR_PATH}/.vimrc        ~/.vimrc
diff -u ${DIR_PATH}/.vimshrc      ~/.vimshrc
diff -u ${DIR_PATH}/.xvimrc       ~/.xvimrc
diff -u ${DIR_PATH}/.zshrc        ~/.zshrc
