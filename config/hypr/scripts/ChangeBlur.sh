#!/bin/bash
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images"

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "1" ]; then
	hyprctl keyword decoration:blur:size 5
	hyprctl keyword decoration:blur:passes 2
 	notify-send -e -u low -i "$notif/note.png" " Normal Blur"
else
	hyprctl keyword decoration:blur:size 2
	hyprctl keyword decoration:blur:passes 1
  	notify-send -e -u low -i "$notif/note.png" " Less Blur"
fi
