#!/bin/sh

brew update
brew upgrade
brew cleanup

pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --upgrade neovim
pip3 install --upgrade neovim
pip2 install --upgrade jedi
pip3 install --upgrade jedi

# brew doctor

cd ${HOME}/src/neovim && git pull origin master
install-neovim.sh
