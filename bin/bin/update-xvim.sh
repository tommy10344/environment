#!/bin/sh

xcode-select --install

cd $(ghq root)/github.com/XVimProject/XVim2

make uninstall
make clean
git checkout develop
git pull
# sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
make
