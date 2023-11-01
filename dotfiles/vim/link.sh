#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sfn "${BASE_DIR}/vimrc"      "${HOME}/.vimrc"

# vim
mkdir -p "${HOME}/.vim"
ln -sfn "${BASE_DIR}/rc"  	"${HOME}/.vim/"
ln -sfn "${BASE_DIR}/ftplugin"	"${HOME}/.vim/"
ln -sfn "${BASE_DIR}/coc-settings.json"	"${HOME}/.vim/"

# neovim
# rm -f ${HOME}/.config/nvim/init.vim
mkdir -p "${HOME}/.config/nvim"
ln -sfn "${BASE_DIR}/vimrc" 	"${HOME}/.config/nvim/init.vim"
ln -sfn "${BASE_DIR}/ftplugin" 	"${HOME}/.config/nvim"
ln -sfn "${BASE_DIR}/coc-settings.json" 	"${HOME}/.config/nvim"
