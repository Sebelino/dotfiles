#!/bin/bash

# Usage:
# ./addimage bild.png

IMG=$1

for f in *.wav; do
    ffmpeg -loop 1 -i $IMG -i $f -c:v libx264 -preset medium -crf 18 -tune stillimage -c:a copy -shortest `basename $f .wav`.mkv
done
