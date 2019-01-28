#!/bin/sh

cd $(ghq root)/github.com/flutter/flutter

git pull origin master
flutter upgrade
