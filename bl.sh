#!/bin/bash

DFLT=2200
MAX_BRIGTHNESS=7500

if [ $# -ne 2 ]; then
	echo "Backlight is now set to default ($DFLT)"
	echo "Usage: $0 [-inc|-dec] value"
	echo $DFLT > /sys/class/backlight/intel_backlight/brightness 
	exit 0
fi	

actual_brightness=$(cat /sys/class/backlight/intel_backlight/actual_brightness)

if [ $1 == "-inc" ]; then
	value=$(($actual_brightness + $2))
	if [ $value -le $MAX_BRIGTHNESS ]; then
		echo $value > /sys/class/backlight/intel_backlight/brightness
	fi
	exit 0
fi	

if [ $1 == "-dec" ]; then
	value=$(($actual_brightness - $2))
	echo $value > /sys/class/backlight/intel_backlight/brightness
	exit 0
fi	

echo "Unknown parameters"
echo "Usage: $0 [-inc|-dec] value"
exit 1
