#!/bin/sh

xcode-select --install

brew update
brew upgrade
brew cleanup
# brew doctor

pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade neovim
pip3 install --upgrade neovim
pip2 install --upgrade jedi
pip3 install --upgrade jedi

npm install -g npm
npm install -g neovim

gem update
rbenv rehash

go get -u github.com/nsf/gocode

# Update neovim
${HOME}/bin/update-neovim.sh
nvim +UpdatePlugin +UpdateRemotePlugins +qa

# Update XVim
${HOME}/bin/XVim/update-xvim.sh

# Update Flutter
${HOME}/bin/update-flutter.sh
