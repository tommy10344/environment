#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

${BASE_DIR}/dotfiles/link.sh
${BASE_DIR}/bin/link.sh
