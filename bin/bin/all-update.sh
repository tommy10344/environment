#!/bin/sh

xcode-select --install

brew update
brew upgrade
brew cask upgrade
brew cleanup
# brew doctor

pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade pynvim
pip3 install --upgrade pynvim
pip2 install --upgrade jedi
pip3 install --upgrade jedi

npm install -g npm
npm install -g neovim
npm install -g express-generator
npm install -g npm-check-updates
npm install -g firebase-tools

gem update
rbenv rehash

go get -u github.com/nsf/gocode

# Update neovim
# ${HOME}/bin/build-neovim.sh
nvim +UpdatePlugin +UpdateRemotePlugins +qa

# Update XVim
${HOME}/bin/XVim/update-xvim.sh

# Update Flutter
${HOME}/bin/update-flutter.sh
