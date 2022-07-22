#!/bin/sh

set -x

# Xcode
rm -rf "${HOME}/Library/Caches/com.apple.dt.Xcode"
rm -rf "${HOME}/Library/Developer/Xcode/DerivedData"
rm -rf "${HOME}/Library/Developer/Xcode/iOS Device Logs"
rm -rf "${HOME}/Library/Developer/Xcode/iOS DeviceSupport"

# Homebrew
brew cleanup -s
rm -rf $(brew --cache)

# CocoaPods
pod cache clean --all

# Carthage
rm -rf "${HOME}/Library/Caches/org.carthage.CarthageKit"
rm -rf "${HOME}/Library/Caches/carthage"
