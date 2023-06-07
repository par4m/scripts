#!/bin/bash

# xrandr --output eDP1 --set "Broadcast RGB" "Full"
# xrandr --auto --output HDMI1 --primary --mode 1920x1200 --output LVDS1 --below eDP1 --mode 1920x1080
xrandr --auto --output eDP1 --primary --set "Broadcast RGB" "Full" --output DP1 --right-of eDP1 --mode 1920x1080

xgamma -quiet -rgamma 0.88 -ggamma 0.85 -bgamma 0.70
