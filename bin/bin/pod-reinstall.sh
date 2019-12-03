#!/bin/sh

rm -rf "${HOME}/Library/Caches/CocoaPods"
rm -rf Pods
pod install --repo-update
