#!/bin/bash

# check if battery exits and run xfce4-power-manager
if [ -d '/sys/class/power_supply/BAT0/' ] || [ -d '/sys/class/power_supply/BAT1/' ]; then
    pidof xfce4-power-manager 1>/dev/null || xfce4-power-manager &
else
    echo "Battery Not Found!"
fi

# network manager applet 
pidof nm-applet 1>/dev/null || nm-applet &

# volctl applet
pgrep volctl 1>/dev/null || volctl &

# blueman applet
pidof blueman-applet 1>/dev/null || blueman-applet &
