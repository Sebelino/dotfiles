#!/bin/sh

vim ~/.xmobarrc

set -x

pkill -x xmobar
xmobar &
