#!/bin/sh

set -x

BASE_DIR=$(cd $(dirname $0);pwd)
DOTFILES_DIR=${BASE_DIR}/dotfiles
BIN_DIR=${BASE_DIR}/bin

/bin/echo -n "Your Name?: "
read NAME

/bin/echo -n "Email Address?: "
read EMAIL_ADDRESS

if [ ! -f "${HOME}/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -b 4096 -C "${EMAIL_ADDRESS}"
fi

ln -sfn "${HOME}/Library/Mobile Documents/com~apple~CloudDocs" "${HOME}/icloud-drive"


# ----- Setup dotfiles (Create symbolic links) -----
./link.sh

## For subsequent commands
source ~/shrc.d/path.sh

# ----- macOS defaults -----
${BASE_DIR}/setup_defaults.sh

# ----- CLI tools -----

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-versions

brew install bash
brew install bash-completion
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestion
brew install python
brew install python3
brew install lua
brew install go
brew install deno
brew install git
brew install openssl
brew install curl
brew install wget
brew install the_silver_searcher
brew install ripgrep
brew install ctags
brew install tree
brew install fzf
brew install ghq
brew install autossh
brew install jsonlint
brew install jq
brew install fastlane
brew install cloc
brew install walk

# zsh (to default shell)
if [ -d "/usr/local/bin/zsh" ]; then
    sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
    chpass -s /usr/local/bin/zsh
fi
if [ -d "/opt/homebrew/bin/zsh" ]; then
    sudo sh -c "echo '/opt/homebrew/bin/zsh' >> /etc/shells"
    chpass -s /opt/homebrew/bin/zsh
fi


# zsh-completions
rm -f ~/.zcompdump; compinit
sudo chmod -R 755 /usr/local/share/zsh
sudo chmod -R 755 /usr/local/share/zsh/site-functions

# git config
git config --global user.name "${NAME}"
git config --global user.email "${EMAIL_ADDRESS}"
git config --global user.useConfigOnly true
git config --global pull.ff only
git config --global diff.wsErrorHighlight all
git config --global pager.branch false
git config --global ghq.root ~/src
git config --global alias.unstage "restore --staged"
git config --global alias.name "config user.name"
git config --global alias.email "config user.email"

# Haskell
# brew install haskell-stack
# stack install ghc-mod hlint haskell-docs
# stack install hoogle && hoogle data

# Ruby
brew install ruby
brew install rbenv
brew install ruby-build
eval "$(rbenv init -)"
rbenv install 3.1.3
rbenv global 3.1.3
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
brew install volta  # https://volta.sh/
volta install node
npm install -g npm
npm install -g yarn
npm install -g http-server
npm install -g npm-check-updates
npm install -g firebase-tools

# Vim
brew install vim

# NeoVim
brew install neovim --HEAD
# ghq get https://github.com/neovim/neovim
# brew install ninja libtool automake cmake pkg-config gettext
pip3 install --user pynvim
pip3 install --user neovim-remote
pip3 install --user Send2Trash
gem install neovim
npm install -g neovim
# ${BIN_DIR}/bin/build-neovim.sh

# Install vim-plug (https://github.com/junegunn/vim-plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Swift
brew install sourcekitten
brew install swiftlint

# iOS
brew install mint

## Install Quick Template (https://github.com/Quick/Quick/blob/main/Documentation/ja/InstallingFileTemplates.md)
ghq get https://github.com/Quick/Quick
cd $(ghq root)/github.com/Quick/Quick
rake templates:install

## Device Support files
ghq get https://github.com/filsv/iPhoneOSDeviceSupport

# gibo
brew install gibo
gibo update

# Flutter
# https://docs.flutter.dev/get-started/install/macos#downloading-straight-from-github-instead-of-using-an-archive
ghq get -b stable https://github.com/flutter/flutter

# ----- Homebrew Cask -----
brew tap homebrew/cask-fonts
brew bundle install --file="${DOTFILES_DIR}/Brewfile-cask"

# ----- Setup Visual Studio Code -----
${DOTFILES_DIR}/vscode/setup.sh
