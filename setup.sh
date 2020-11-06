#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)
DOTFILES_DIR=${BASE_DIR}/dotfiles
BIN_DIR=${BASE_DIR}/bin

/bin/echo -n "Email Address?: "
read EMAIL_ADDRESS

ssh-keygen -t rsa -b 4096 -C "${EMAIL_ADDRESS}"

ln -sfn "${HOME}/Library/Mobile Documents/com~apple~CloudDocs" "${HOME}/icloud-drive"

# ----- macOS defaults -----
${BASE_DIR}/setup_defaults.sh

# ----- CLI tools -----

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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
brew install tig
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
brew install fastlane

# zsh (to default shell)
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chpass -s /usr/local/bin/zsh

# zsh-completions
rm -f ~/.zcompdump; compinit
sudo chmod -R 755 /usr/local/share/zsh
sudo chmod -R 755 /usr/local/share/zsh/site-functions

# git config
git config --global user.name "Hiroaki Tomiyoshi"
git config --global user.email "${EMAIL_ADDRESS}"
git config --global user.useConfigOnly true
git config --global pull.ff only
git config --global pager.branch false
git config --global ghq.root ~/src
git config --global alias.unstage "restore --staged"

# haskell
# brew install haskell-stack
# stack install ghc-mod hlint haskell-docs
# stack install hoogle && hoogle data

# ruby
brew install ruby && brew link ruby
brew install rbenv
brew install ruby-build
eval "$(rbenv init -)"
rbenv install 2.6.3
rbenv global 2.6.3
rbenv rehash
gem install bundler
gem install iStats
gem install rcodetools  # for deoplete-rct
gem install solargraph  # Ruby language server
gem install mdl # markdownlint
gem install rubocop
gem install jazzy # Generates documentation for Swift or Objective-C
gem install xcprofiler  # Xcode build time profiler
rbenv rehash

# Node.js
brew install node
npm install -g npm
npm install -g yarn
npm install -g express-generator
npm install -g npm-check-updates
npm install -g firebase-tools
npm install -g gatsby-cli

# vim
brew install vim
# brew install macvim --with-lua --with-luajit --with-python3
# brew linkapps macvim

# neovim
brew install neovim
ghq get https://github.com/neovim/neovim
brew install ninja libtool automake cmake pkg-config gettext
pip3 install --user pynvim
pip3 install --user neovim-remote
pip3 install --user Send2Trash
gem install neovim
npm install -g neovim
${BIN_DIR}/bin/build-neovim.sh

# swift
brew install sourcekitten
brew install swiftlint
pip3 install -- user pyyaml # for autocomplete-swift plugin (vim)

# iOS / Swift
brew install carthage
brew install cocoapods
brew install mint
brew install xcodegen
pod setup

# Flutter
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy

# gibo
brew install gibo
gibo update

# oss-src
ghq get https://github.com/XVimProject/XVim2
ghq get https://github.com/altercation/solarized
ghq get https://github.com/ArtSabintsev/Solarized-Dark-for-Xcode
ghq get https://github.com/flutter/flutter
ghq get https://github.com/filsv/iPhoneOSDeviceSupport


# ----- Homebrew Cask -----
brew tap homebrew/cask-fonts
brew bundle install --file="${DOTFILES_DIR}/Brewfile-cask"

# ----- Setup Visual Studio Code -----
${DOTFILES_DIR}/vscode/setup.sh

# ----- Setup dotfiles -----
ghq get https://github.com/tommy10344/environment
cd $(ghq root)/github.com/tommy10344/environment
git remote set-url origin git@github.com:tommy10344/environment.git
./link.sh
