#!/bin/sh

# Check that you have the right device with dmesg

set -x

sudo sh -c 'echo on > /sys/bus/usb/devices/3-1/power/control'
sudo sh -c 'echo on > /sys/bus/usb/devices/3-2/power/control'
