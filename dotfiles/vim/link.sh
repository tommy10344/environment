#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sf "${BASE_DIR}/vimrc"      "${HOME}/.vimrc"
ln -sf "${BASE_DIR}/gvimrc"     "${HOME}/.gvimrc"
# ln -sf "${BASE_DIR}/vimshrc"    "${HOME}/.vimshrc"

# vim
mkdir -p "${HOME}/.vim"
ln -sf "${BASE_DIR}/rc"  	"${HOME}/.vim/"
ln -sf "${BASE_DIR}/ftplugin"	"${HOME}/.vim/"

# neovim
# rm -f ${HOME}/.config/nvim/init.vim
mkdir -p "${HOME}/.config/nvim"
ln -sf "${BASE_DIR}/vimrc" 	"${HOME}/.config/nvim/init.vim"
ln -sf "${BASE_DIR}/ftplugin" 	"${HOME}/.config/nvim"
