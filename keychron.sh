#!/bin/bash

bluetoothctl connected Devices | cut -f2 -d' ' |
	while read -r uuid; do
		info=$(bluetoothctl info $uuid)
		if echo "$info" | grep -q "Connected: yes"; then
			echo "$info" | grep "Name"
		fi
	done
