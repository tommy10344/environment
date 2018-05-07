#!/bin/bash

INPUT=$1
OUTPUT=${INPUT}.avi
ffmpeg -i ${INPUT} -vcodec msmpeg4v2 -b 2000k -r 10 -an ${OUTPUT}
