#!/bin/sh

# cd ${HOME}/src/neovim/
cd $(ghq root)/github.com/neovim/neovim

rm -r build/
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"
