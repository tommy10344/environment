#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)
DOTFILES_DIR=${BASE_DIR}/dotfiles
BIN_DIR=${BASE_DIR}/bin

EMAIL_ADDRESS="htomiyosi@gmail.com"

ssh-keygen -t rsa -b 4096 -C "${EMAIL_ADDRESS}"

ln -sfn "${HOME}/Library/Mobile Documents/com~apple~CloudDocs" "${HOME}/icloud-drive"

# ----- Dock Settings -----

# Dock を自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockの表示位置(左)
defaults write com.apple.dock orientation -string "left"

# ----- AirDrop Settings -----

# 有線接続でもAirDropを可能にする

defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1


# ----- Mission Control -----

# ウインドウをアプリケーションごとにグループ化
defaults write com.apple.dock expose-group-apps -bool true


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


# ----- Date settings -----

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm:ss"

# ----- Safari settings -----

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true


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
brew install docker-clean
brew install fzf
brew install ghq
brew install autossh

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
gem install rcodetools  # for deoplete-rct
gem install solargraph  # Ruby language server
gem install mdl # markdownlint
gem install rubocop
rbenv rehash

# Node.js
brew install node
npm install -g npm
npm install -g jq
npm install -g express-generator
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
${BIN_DIR}/bin/build-neovim.sh

# swift
brew install sourcekitten
brew install swiftlint
pip3 install pyyaml # for autocomplete-swift plugin (vim)

# Cocoapods
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
brew bundle install --file="${DOTFILES_DIR}/Brewfile-cask"

# ----- Setup dotfiles -----
ghq get https://github.com/tommy10344/environment
cd $(ghq root)/github.com/tommy10344/environment
./link.sh
