#!/bin/sh

xcode-select --install

brew update
brew upgrade
brew cleanup

pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade neovim
pip3 install --upgrade neovim
pip2 install --upgrade jedi
pip3 install --upgrade jedi

go get -u github.com/nsf/gocode

# brew doctor

# Update neovim
${HOME}/bin/update-neovim.sh

# Update XVim
${HOME}/bin/XVim/update-xvim.sh
