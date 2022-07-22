#!/bin/bash

xrandr --output eDP1 --set "Broadcast RGB" "Full"
xgamma -quiet -rgamma 0.88 -ggamma 0.85 -bgamma 0.70
