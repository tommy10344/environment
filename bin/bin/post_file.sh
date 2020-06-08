#!/bin/sh

URL=$1
FILE_PATH=$2

curl \
  --request POST \
  --data @${FILE_PATH} \
  ${URL}
