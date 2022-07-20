#!/bin/bash

# check if battery exits and run xfce4-power-manager
if [ -d '/sys/class/power_supply/BAT0/' ] || [ -d '/sys/class/power_supply/BAT1/' ]; then
    pidof xfce4-power-manager 1>/dev/null || xfce4-power-manager & disown
    xfcepid=$(pidof xfce4-power-manager)
    # Ensure that xfce4-power-manager has started running before moving on to start the WM/DE.
    [ -n "$xfcepid" ] && wait "$xfcepid"
else
    echo "Battery Not Found!"
fi

# network manager applet 
pidof nm-applet 1>/dev/null || nm-applet & disown
nmpid=$(pidof nmpid)
# Ensure that nm-applet has started running before moving on to start the WM/DE.
[ -n "$nmpid" ] && wait "$nmpid"


# blueman applet
pidof blueman-applet 1>/dev/null || blueman-applet & disown
bluepid=$(pidof blueman-applet)
# Ensure that blueman-applet has started running before moving on to start the WM/DE.
[ -n "$bluepid" ] && wait "$bluepid"


# volctl applet
pgrep volctl 1>/dev/null || volctl & disown
volpid=$(pgrep volctl)
# Ensure that volctl has started running before moving on to start the WM/DE.
[ -n "$volpid" ] && wait "$volpid"


