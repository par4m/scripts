#!/bin/bash

# load Xresources
# xrdb ~/.Xresources
dwmblocks &
feh --bg-scale ~/wallpapers/nord/underwater.png
# feh --bg-scale ~/wallpapers/catppuccin/girl.png
~/.xsession
~/.local/bin/scripts/display.sk
remap-keys

# alttab &

while :; do
	dwm 2>~/.dwm.log
	source ~/.local/bin/scripts/tray.sh
	source ~/.local/bin/scripts/display.sh
	# pidof nm-applet 1>/dev/null || nm-applet &
	# pgrep volctl 1>/dev/null || volctl &
	# source battery_check
done
