#!/bin/sh

lock=" Lock screen"
reboot="󰜉 Reboot"
shutdown="󰐥 Shut down"
confirmation_yes="󰡕 Yes"
confirmation_no="󰛉 No"

display_list=""
set -- "$shutdown" "$lock" "$reboot"
for ele in "$@"; do
	if [ ${#display_list} -eq 0 ]; then
		display_list="$ele"
	else
		display_list="$display_list\n$ele"
	fi
done

set -- "$confirmation_yes" "$confirmation_no"
confirmation_list=""
for ele in "$@"; do
	if [ ${#confirmation_list} -eq 0 ]; then
		confirmation_list="$ele"
	else
		confirmation_list="$confirmation_list\n$ele"
	fi
done

selected_option=$(echo "$display_list" | rofi -dmenu -i -p "󰐦 Power Menu")

if [ "$selected_option" = "" ]; then
	exit 130
fi

if [ "$selected_option" = "$lock" ]; then
	xautolock -locknow
elif [ "$selected_option" = "$reboot" ]; then
	selected_confirmation_option=$(echo "$confirmation_list" | rofi -dmenu -i -p "Sure ")
	if [ "$selected_confirmation_option" = "$confirmation_yes" ]; then
		systemctl reboot
	else
		exit 0
	fi
elif [ "$selected_option" = "$shutdown" ]; then
	selected_confirmation_option=$(echo "$confirmation_list" | rofi -dmenu -i -p "Sure ")
	if [ "$selected_confirmation_option" = "$confirmation_yes" ]; then
		systemctl poweroff
	else
		exit 0
	fi
fi
