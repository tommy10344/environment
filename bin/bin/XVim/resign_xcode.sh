#!/bin/sh

# Usage: resign_xcode.sh /Applications/Xcode.app

XCODE=$1
sudo codesign -f -s XcodeSigner ${XCODE}
