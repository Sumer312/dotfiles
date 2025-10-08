#!/bin/sh

dunstify "Getting list of available Wi-Fi networks..." -t 2500

secure_icon="󰤪"
insecure_icon="󱛎"

wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/$secure_icon/g" | sed "s/^--/$insecure_icon/g" | sed "s/$secure_icon $secure_icon/$secure_icon/g" | sed "/--/d")
connection=$(nmcli --fields WIFI g)

if echo "$connection" | grep -q "disabled"; then
	toggle="󰤨 Enable Wi-Fi"
else
	toggle="󰤮 Disable Wi-Fi"
fi

selected_option=$(echo "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -p "  SSID")
substring=$(echo "$selected_option" | cut -c 5-)
chosen_id=$(echo "$substring" | xargs)

if [ "$selected_option" = "" ]; then
	exit 130
elif echo "$selected_option" | grep -q "Disable Wi-Fi"; then
	nmcli radio wifi off
elif echo "$selected_option" | grep -q "Enable Wi-Fi"; then
	nmcli radio wifi on
else
	flag=0
	if [ -n $(nmcli connection show | grep wifi | grep -q "$chosen_id") ]; then
    echo $chosen_id
    echo $selected_option
		if nmcli connection up "$chosen_id"; then
			flag=1
		fi
	else
		if echo "$selected_option" | grep -q $secure_icon; then
			wifi_password=$(rofi -dmenu -p " Password: ")
			if nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully"; then
				flag=1
			fi
		else
			if nmcli device wifi connect "$chosen_id" | grep "successfully"; then
				flag=1
			fi
		fi
	fi
	if [ "$flag" = 1 ]; then
		success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
		dunstify "Connection Established" "$success_message" -t 2000
	else
		dunstify -u critical "Connection activation failed" -t 2000
	fi
fi
