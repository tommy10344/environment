#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

ln -sf "${BASE_DIR}/bin" "${HOME}/bin"
