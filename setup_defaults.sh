#!/bin/sh

# ----- Dock -----

# Dockに起動中のアプリのみを表示する
defaults write com.apple.dock static-only -bool true

# Dock を自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockの表示位置
# defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock orientation -string "bottom"

# ----- AirDrop -----

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
# defaults write com.apple.dock wvous-tl-corner -int 3
# defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right
# defaults write com.apple.dock wvous-tr-corner -int 2
# defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right
# defaults write com.apple.dock wvous-br-corner -int 0
# defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock


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


# ----- Finder -----

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# ネットワーク共有フォルダにDS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 検索実行時にデフォルトで現在のフォルダを検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

killall Finder


# ----- Input Method -----

# "¥"キーで入力する文字 -> バックスラッシュ
defaults write com.apple.inputmethod.Kotoeri 'JIMPrefCharacterForYenKey' -int 1

killall JapaneseIM 2>/dev/null || true

# ----- Xcode -----

## プログレスバーにビルド時間を表示
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

## Navigation Style: Open in Place
defaults write com.apple.dt.Xcode IDEEditorNavigationStyle_DefaultsKey -string "IDEEditorNavigationStyle_OpenInPlace"

## Vim Mode
defaults write com.apple.dt.Xcode KeyBindingsMode -string "Vi"


# ----- Date -----

# メニューバーの時計（24時間表示、秒表示あり、曜日を表示、日付はスペースに余裕があるとき）
# macOS 11 以降は DateFormat の書式文字列ではなく項目ごとのキーで決まる。
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
# 0: スペースに余裕があるとき  1: 常に  2: 表示しない
defaults write com.apple.menuextra.clock ShowDate -int 0

killall ControlCenter

# ----- Safari -----

# Safari の設定はサンドボックスのコンテナ内にあり、ターミナルにフルディスクアクセスが無いと
# defaults では読み書きできない(書いても Safari が読まない別ファイルに入る)。
# 「開発」メニューの表示と「ダウンロード後に安全なファイルを開く」のオフは、Safari の設定画面で行う。


# ----- iTerm2 -----

# Python APIを有効化（Claude Code Agent Teams の Split Panes で必要）
defaults write com.googlecode.iterm2 EnableAPIServer -bool true
