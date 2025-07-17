#!/bin/sh

dunstify "Getting list of available Wi-Fi networks..." -t 2500

wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S//g" | sed "s/^--//g" | sed "s/ //g" | sed "/--/d")
connection=$(nmcli --fields WIFI g)

if echo "$connection" | grep -q "disabled"; then
	toggle="󰤨 Enable Wi-Fi"
else
	toggle="󰤮 Disable Wi-Fi"
fi

selected_option=$(echo "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -p "  SSID")
substring=$(echo "$selected_option" | cut -c 4-)
chosen_id=$(echo "$substring" | xargs)

if [ "$selected_option" = "" ]; then
	exit 130
elif echo "$selected_option" | grep -q "󰤮 Disable Wi-Fi"; then
	nmcli radio wifi off
elif echo "$selected_option" | grep -q "󰤨 Enable Wi-Fi"; then
	nmcli radio wifi on
else
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	secure_connection=$(echo "$selected_option" | grep "")
	if [ -n secure_connection ]; then
		wifi_password=$(rofi -dmenu -p " Password: ")
	fi
	if nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully"; then
		dunstify "Connection Established" "$success_message" -t 2000
	else
		dunstify -u critical "Connection activation failed" -t 2000
	fi
fi
