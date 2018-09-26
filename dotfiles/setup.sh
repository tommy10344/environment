#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)
${BASE_DIR}/../link.sh

# ----- Dock Settings -----

# Dock を自動的に隠す
# defaults write com.apple.dock autohide -bool true

# ----- AirDrop Settings -----

# 有線接続でもAirDropを可能にする

defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1


# ----- Mission Control -----

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right
# defaults write com.apple.dock wvous-br-corner -int 0
# defaults write com.apple.dock wvous-br-modifier -int 0


# ----- Key repeat -----

# キーリピート速度
defaults write -g KeyRepeat -int 1
# キーリピート開始速度
defaults write -g InitialKeyRepeat -int 15

# Reset
# defaults delete -g KeyRepeat
# defaults delete -g InitialKeyRepeat

# Read
# defaults read -g KeyRepeat
# defaults read -g InitialKeyRepeat


# ----- Finder Settings -----

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool YES

# ネットワーク共有フォルダにDS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

killall Finder


# ----- Xcode Settings -----

## プログレスバーにビルド時間を表示
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
## 並列ビルド設定 (並列数: 8)
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks 8


# ----- CLI tools -----

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew install gibo
brew install docker-clean
brew install fzf
brew install ghq

# zsh (to default shell)
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chpass -s /usr/local/bin/zsh

# zsh-completions
rm -f ~/.zcompdump; compinit

# git config
git config --global user.name "Hiroaki Tomiyoshi"
git config --global user.email htomiyosi@gmail.com
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
gem install rcodetools  # for deoplete-rct
gem install solargraph  # Ruby language server
gem install mdl # markdownlint
rbenv rehash

# Node.js
brew install node
npm install -g npm
npm install -g jq
npm install -g create-react-app
npm install -g react-native-cli
npm install -g vue-cli

# vim
brew install vim
# brew install macvim --with-lua --with-luajit --with-python3
# brew linkapps macvim

# neovim
# brew install neovim/neovim/neovim --HEAD
ghq get https://github.com/neovim/neovim
brew install ninja libtool automake cmake pkg-config gettext
pip install neovim
pip3 install neovim
pip3 install neovim-remote
gem install neovim
npm install -g neovim
${HOME}/bin/build-neovim.sh

# swift
brew install sourcekitten
pip3 install pyyaml # for autocomplete-swift plugin (vim)

# Cocoapods
brew install cocoapods
pod setup

# Flutter
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy

# golang
go get -u github.com/nsf/gocode

# oss-src
ghq get https://github.com/XVimProject/XVim2
ghq get https://github.com/altercation/solarized
ghq get https://github.com/ArtSabintsev/Solarized-Dark-for-Xcode
ghq get https://github.com/flutter/flutter


# ----- Setup dotfiles -----
ghq get https://github.com/kurozu10344/environment
cd $(ghq root)/github.com/kurozu10344/environment
./link.sh
