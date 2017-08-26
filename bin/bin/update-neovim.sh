#!/bin/sh

# cd ${HOME}/src/neovim/
cd $(ghq root)/github.com/neovim/neovim

rm -rf build
git pull origin master
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
