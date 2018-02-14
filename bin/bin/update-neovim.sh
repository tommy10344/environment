#!/bin/sh

xcode-select --install

cd $(ghq root)/github.com/neovim/neovim

rm -rf build
make clean
make distclean
git pull origin master
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${HOME}/neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
