#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)
DOTFILES_DIR=${BASE_DIR}/dotfiles
BIN_DIR=${BASE_DIR}/bin

EMAIL_ADDRESS="htomiyosi@gmail.com"

ssh-keygen -t rsa -b 4096 -C "${EMAIL_ADDRESS}"

ln -sfn "${HOME}/Library/Mobile Documents/com~apple~CloudDocs" "${HOME}/icloud-drive"

# ----- macOS defaults -----
${BASE_DIR}/setup_defaults.sh

# ----- CLI tools -----

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions

brew install bash
brew install bash-completion
brew install zsh
brew install zsh-completions
brew install python
brew install python3
brew install lua
brew install go
brew install git
brew install wget
brew install the_silver_searcher
brew install ripgrep
brew install ctags
brew install tree
brew install docker-clean
brew install fzf
brew install ghq
brew install autossh
brew install jsonlint
brew install jq

# zsh (to default shell)
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chpass -s /usr/local/bin/zsh

# zsh-completions
rm -f ~/.zcompdump; compinit

# git config
git config --global user.name "Hiroaki Tomiyoshi"
git config --global user.email "${EMAIL_ADDRESS}"
git config --global user.useConfigOnly true
git config --global ghq.root ~/src

# haskell
# brew install haskell-stack
# stack install ghc-mod hlint haskell-docs
# stack install hoogle && hoogle data

# ruby
brew install ruby && brew link ruby
brew install rbenv
brew install ruby-build
eval "$(rbenv init -)"
rbenv install 2.5.1
rbenv rehash
gem install bundler
gem install rcodetools  # for deoplete-rct
gem install solargraph  # Ruby language server
gem install mdl # markdownlint
gem install rubocop
rbenv rehash

# Node.js
brew install node
npm install -g npm
npm install -g npm-check-updates
npm install -g express-generator
npm install -g create-react-app
npm install -g react-native-cli
npm install -g vue-cli

# vim
brew install vim
# brew install macvim --with-lua --with-luajit --with-python3
# brew linkapps macvim

# neovim
brew install neovim
ghq get https://github.com/neovim/neovim
brew install ninja libtool automake cmake pkg-config gettext
pip2 install pynvim
pip3 install pynvim
pip3 install neovim-remote
gem install neovim
npm install -g neovim
${BIN_DIR}/bin/build-neovim.sh

# swift
brew install sourcekitten
brew install swiftlint
pip3 install pyyaml # for autocomplete-swift plugin (vim)

# iOS
brew install carthage
brew install cocoapods
pod setup

# Flutter
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy

# golang
go get -u github.com/nsf/gocode

# gibo
brew install gibo
gibo update

# oss-src
ghq get https://github.com/XVimProject/XVim2
ghq get https://github.com/altercation/solarized
ghq get https://github.com/ArtSabintsev/Solarized-Dark-for-Xcode
ghq get https://github.com/flutter/flutter


# ----- Homebrew Cask -----
brew tap homebrew/cask-fonts
brew bundle install --file="${DOTFILES_DIR}/Brewfile-cask"

# ----- Setup Visual Studio Code -----
${DOTFILES_DIR}/vscode/setup.sh

# ----- Setup dotfiles -----
ghq get https://github.com/tommy10344/environment
cd $(ghq root)/github.com/tommy10344/environment
./link.sh
