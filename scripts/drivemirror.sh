#!/bin/bash

set -x

FROM_PATH=`readlink -f "$1"`
DRIVE_ROOT_DIR="$HOME/extra/gdrive/zenia"

TO_PATH="$DRIVE_ROOT_DIR/$FROM_PATH"
TO_PATH_DIR=`dirname $TO_PATH`

mkdir -p $TO_PATH_DIR
cp -r --no-target-directory "$FROM_PATH" "$TO_PATH"
cd $TO_PATH_DIR
drive push -hidden $TO_PATH

