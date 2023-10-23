#!/bin/sh

code --install-extension vscodevim.vim
code --install-extension editorconfig.editorconfig
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension yzhang.markdown-all-in-one
code --install-extension davidanson.vscode-markdownlint
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension jebbs.plantuml
code --install-extension humao.rest-client
code --install-extension ms-vscode.hexeditor
code --install-extension dracula-theme.theme-dracula
code --install-extension vscode-icons-team.vscode-icons
code --install-extension oderwat.indent-rainbow

# Azure DevOps
code --install-extension ms-azure-devops.azure-pipelines

# Swift
code --install-extension sswg.swift-lang

# Flutter
code --install-extension dart-code.flutter

# Firebase
code --install-extension chflick.firecode

# Ruby
code --install-extension kaiwood.endwise
code --install-extension castwide.solargraph
code --install-extension shopify.ruby-lsp

# JavaScript / Node.js / TypeScript
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.npm-intellisense

# Golang
code --install-extension golang.go


# For VSCodeVim: Enable key-repeating
# https://github.com/VSCodeVim/Vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled
