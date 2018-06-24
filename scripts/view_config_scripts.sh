#!/bin/bash

if [[ $# -eq 0 ]] ; then
    SCRIPTNAME=`basename "$0"`
    echo "Usage: $SCRIPTNAME PATTERN"
    exit 0
fi

set -x

PATTERN="$1"

FILES=( \
"$HOME/.profile" \
"$HOME/.zshrc" \
"$HOME/.bashrc" \
"$HOME/.bash_profile" \
"$HOME/.bash_aliases" \
"$HOME/.bash_logout" \
"$HOME/.zprofile" \
"$HOME/.xinitrc" \
"$HOME/.xprofile" \
"$HOME/.Xresources" \
"$HOME/.XCompose" \
"$HOME/.xscreensaver" \
"$HOME/.xmobarrc" \
)

ack "$PATTERN" ${FILES[@]}

