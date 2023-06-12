#!/bin/sh

# ----- Dock -----

# Dockに起動中のアプリのみを表示する
defaults write com.apple.dock static-only -boolean true

# Dock を自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockの表示位置
# defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock orientation -string "bottom"

killall Dock

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
defaults write com.apple.finder AppleShowAllFiles -bool YES

# ネットワーク共有フォルダにDS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 検索実行時にデフォルトで現在のフォルダを検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

killall Finder


# ----- Input Method -----

# "¥"キーで入力する文字 -> バックスラッシュ
defaults write com.apple.inputmethod.Kotoeri 'JIMPrefCharacterForYenKey' -int 1

killall JapaneseIM

# ----- Xcode -----

## プログレスバーにビルド時間を表示
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
## Navigation Style: Open in Place
defaults write com.apple.dt.Xcode IDEEditorNavigationStyle_DefaultsKey -string "IDEEditorNavigationStyle_OpenInPlace"


# ----- Date -----

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm:ss"

# ----- Safari -----

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
