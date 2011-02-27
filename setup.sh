#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

# available keys
KEYS=("e,v,c,h,t,b,q,r,t,y,u,i,o,p,d,f,g,h,j,k,l,z,x,c,v,b,n,m")

for key in $(echo $KEYS | tr "," "\n")
do
  sleep 0.1
  gconftool-2 -s /desktop/gnome/keybindings/shift_win_${key}/binding --type=string "<Shift><Mod4>${key}"
  gconftool-2 -s /desktop/gnome/keybindings/shift_win_${key}/name --type=string "Assign shortcut <Win-${key}>"
  gconftool-2 -s /desktop/gnome/keybindings/shift_win_${key}/action --type=string "$DIRECTORY/assign_current_window.sh ${key}"
  echo "<Win-Shift-${key}> shortcut created."
done

gnome-keybinding-properties &
