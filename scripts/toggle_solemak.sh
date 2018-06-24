#!/bin/sh

out=`setxkbmap -query | grep solemak`

if [ -z "$out" ]; then
    setxkbmap solemak
else
    setxkbmap se
fi

