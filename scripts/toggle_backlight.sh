#!/bin/bash

backlight=`cat /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness`

if [[ $backlight == 0 ]]; then
    asus-kbd-backlight 1
else
    asus-kbd-backlight 0
fi
