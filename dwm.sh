#!/bin/bash

# load Xresources
xrdb ~/.Xresources
dwmblocks &
# alttab &


while :; do
 pidof nm-applet 1>/dev/null || nm-applet &
 pgrep volctl 1>/dev/null || volctl &
 dwm 2> ~/.dwm.log
done
