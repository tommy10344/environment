#!/bin/sh

# ----- Dock Settings -----

# Dock を自動的に隠す
# defaults write com.apple.dock autohide -bool true


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
## 並列ビルド設定 (並列数: 4)
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks 4


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
brew install node
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

# vim
brew install vim --with-lua --with-luajit --with-python3
# brew install macvim --with-lua --with-luajit --with-python3
# brew linkapps macvim

# neovim
brew install neovim/neovim/neovim --HEAD
pip install neovim
pip3 install neovim
pip3 install neovim-remote

# haskell
# brew install haskell-stack
# stack install ghc-mod hlint haskell-docs
# stack install hoogle && hoogle data

# ruby
brew install ruby
brew install rbenv
brew install ruby-build

# swift
brew install sourcekitten
pip3 install pyyaml # for autocomplete-swift plugin (vim)

# git config
# git config --global user.name "Hiroaki Tomiyoshi"
# git config --global user.email htomiyosi@icloud.com
git config --global user.useConfigOnly true
git config --global ghq.root ~/src

# oss-src
ghq get https://github.com/github/gitignore
ghq get https://github.com/XVimProject/XVim
ghq get https://github.com/altercation/solarized
ghq get https://github.com/ArtSabintsev/Solarized-Dark-for-Xcode


# ----- Setup dotfiles -----
./link_dotfiles.sh
