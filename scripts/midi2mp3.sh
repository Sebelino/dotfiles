#!/bin/sh

basename=`basename $1`

timidity "$1" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "$basename.mp3"
