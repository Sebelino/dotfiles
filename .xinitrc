#!/bin/sh

xsetroot -cursor_name left_ptr
setxkbmap solemak

# For using compose keys
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
setxkbmap -option compose:lwin

# Auto-repeat for CapsLock and Menu key
xset r 66
xset r 135

# Auto-repeat speed/delay
xset r rate 250 50

# Load Terminus font
xset +fp /usr/share/fonts/local
xset fp rehash

# Desktop background
feh --bg-fill ~/Pictures/wallpapers/p5chairs.png

# For skype
pulseaudio --start

# Start SSH agent
eval $(ssh-agent)

# Summoning some of my own daemons
#bash ~/scripts/start_daemons.sh &

# Xmonad-relaterat
xcompmgr &
xrdb ~/.Xresources
urxvtd&
xmobar &

# Caps LED off
sudo sh -c 'setleds -D +caps < /dev/console'
sudo sh -c 'setleds -D -caps < /dev/console'

#xscreensaver -no-splash &

# Xmonad itself
exec xmonad
