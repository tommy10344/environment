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

# update-neovim.sh
