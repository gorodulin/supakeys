#!/bin/bash

KEY=$1

WINDOW=$(printf '0x%08X' $(/usr/bin/xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| cut -d ' ' -f 5))

DIRECTORY=$(cd `dirname $0` && pwd)

play $DIRECTORY/beep.wav -q

wmctrl -ia $WINDOW

# set Win-... shortcut
gconftool-2 -s /desktop/gnome/keybindings/win_${KEY}/binding --type=string "<Mod4>${KEY}"
gconftool-2 -s /desktop/gnome/keybindings/win_${KEY}/name --type=string "Win-${KEY} shortcut (automatically assigned)"
gconftool-2 -s /desktop/gnome/keybindings/win_${KEY}/action --type=string "$DIRECTORY/focus.sh ${WINDOW}"

notify-send -i gdu-smart-healthy "win-${KEY} set!"