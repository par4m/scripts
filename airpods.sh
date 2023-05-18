#!/bin/bash


# replace MAC and card name here first time
AIRPODS_MAC='14:88:E6:D2:40:B5' # it should be in blueman-manager
AIRPODS_NAME='bluez_card.14_88_E6_D2_40_B5' # you can find this using 'pactl list cards' command

case "$1" in
    connect)
        bluetoothctl power on
        sleep 3
        bluetoothctl connect $AIRPODS_MAC
        # sudo systemctl start ofono
        # nohup ofono-phonesim -p 12345 /usr/share/phonesim/default.xml &> /tmp/ofono-phonesim.nohup &
        # /opt/ofono/test/enable-modem /phonesim
        pactl set-card-profile $AIRPODS_NAME headset_head_unit
    ;;
    toggle_profile)
        cur=`pactl list | grep -A 30 $AIRPODS_NAME | grep 'Active Profile:' | cut -d' ' -f3`
        if [[ $cur == "a2dp_sink" ]]; then
            pactl set-card-profile $AIRPODS_NAME headset_head_unit
        else
            pactl set-card-profile $AIRPODS_NAME a2dp_sink
        fi
    ;;
    disconnect)
        # /opt/ofono/test/disable-modem /phonesim
        # killall ofono-phonesim
        # sudo systemctl stop ofono
        bluetoothctl disconnect $AIRPODS_MAC
        bluetoothctl power off
        #bluetooth off
    ;;
esac

card_no=`pactl list cards short | grep $AIRPODS_NAME | awk '{print $1}'`
active_profile=`pactl list cards | sed -n -e "/Card #\$card_no/,/Card/ p" | grep 'Active Profile:' | awk '{print $3}'`

if pactl list | grep $AIRPODS_NAME &>>/dev/null; then
    echo "$active_profile"
    echo "active_profile"
    echo "#11ff00"
else
    echo "off"
    echo "off"
    echo "#a6a6a6"
fi

