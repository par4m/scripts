 kill -15 $(ps -u $USER -o pid,%mem,%cpu,comm | sort -b -k2 -r | sed -n '1!p' | dmenu -bw 2 -b -fn 'curie'  -l 10 | awk '{print $1}') 
 notify-send "Process Killed"
