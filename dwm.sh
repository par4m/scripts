#!/bin/bash

# load Xresources
# xrdb ~/.Xresources
dwmblocks &
# alttab &


while :; do
 dwm 2> ~/.dwm.log
 sleep 1
 source ~/.local/bin/scripts/tray.sh
 # pidof nm-applet 1>/dev/null || nm-applet &
 # pgrep volctl 1>/dev/null || volctl &
 # source battery_check
done
