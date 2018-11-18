#!/bin/bash

EXT_DISP="DP-1"
#EXT_DISP="DP-2"

if [ $# -ne 1 ]; then
	echo "Usage: $0 [ on | off ]"
	echo "NB: xrandr command might help to determine if external screen is connected to DP-1 or DP-2."
	exit 0
fi

case "$1" in 
	on)
		echo "Switching ON external display ($EXT_DISP)"
		# Ecran LG @home
		xrandr --output "eDP-1" --mode 3840x2160 --pos 0x0 --output $EXT_DISP --mode 1920x1080 --pos 0x0 --scale-from 3840x2160
		#xrandr --output "eDP-1" --mode 3840x2160 --pos 0x0 --output $EXT_DISP --auto  --pos 0x0 --scale-from 3840x2160
		#xrandr --output "eDP-1" --mode 3840x2160 --pos 0x0 --output "DP-2" --auto --pos 0x0 --scale-from 3840x2160
		;;
	off)
		echo "Switch OFF external screen"
		xrandr --output "DP-1" --off
		xrandr --output "DP-2" --off
		;;	
	*)	echo "Unknown command"
		;;
esac

exit 0

