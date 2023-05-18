#!/bin/bash

# replace MAC and card name here first time
AIRPODS_MAC='14:88:E6:D2:40:B5' # it should be in blueman-manager
AIRPODS_NAME='bluez_card.14_88_E6_D2_40_B5' # you can find this using 'pactl list cards' command


cur=`pactl list | grep -A 30 $AIRPODS_NAME | grep 'Active Profile:' | cut -d' ' -f3`
if [[ $cur == "a2dp_sink" ]]; then
  bluetoothctl power off
elif [[ $cur == '' ]]; then
     bluetoothctl power on
     sleep 3
     bluetoothctl connect $AIRPODS_MAC
     pactl set-card-profile $AIRPODS_NAME a2dp_sink
else
  echo "Different Profile"
fi

