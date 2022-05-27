#!/bin/sh

set -x

# Xcode
xcode-select --install

# Homebrew
brew update
brew upgrade
brew upgrade --cask
brew cleanup
# brew doctor

# Python
pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade pynvim
pip3 install --upgrade pynvim
pip2 install --upgrade jedi
pip3 install --upgrade jedi

# Node.js
npm install -g npm
npm install -g yarn
npm install -g http-server
npm install -g npm-check-updates
npm install -g firebase-tools

# Ruby
gem update
rbenv rehash

# Golang
go get -u github.com/nsf/gocode

# Neovim
# ${HOME}/bin/build-neovim.sh
nvim +UpdatePlugin +UpdateRemotePlugins +qa

# XVim
# ${HOME}/bin/XVim/update-xvim.sh

# Flutter
${HOME}/bin/update-flutter.sh
