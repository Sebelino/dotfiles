#!/bin/sh

xrandr
xrandr --output eDP1  --mode 1920x1080 --pos 0x1080 --primary \
       --output HDMI1 --mode 1920x1080 --pos 0x0 \
       --verbose
