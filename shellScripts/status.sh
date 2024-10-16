#!/bin/sh

send_notification() {
	dunstify -a "batteryNotification" -u critical -r 9994 "󰂃 Plug in charger" -t 2000 &
	mpv --no-video /home/sumer/Music/message-incoming-132126.mp3 &
	wait
}

while :; do
	bool_network=$(nmcli | grep wlo1: | awk '{print $2}')
	bool_wifi_name=$(nmcli | grep wlo1: | awk '{print $4}')
	bool_charging=$(acpi | grep Charging)
	bool_battery_check=$(acpi | grep "Battery 0" | awk -F "%" '{print $1}' | awk -F "," '{print $2}')
	bool_internet_check=$(nmcli networking connectivity check | grep full)

	var_time=$(date +"%H:%M")
	var_date=$(date +"%a %d.%m.%y")
	var_temp=$(acpi -t | awk '{print $4}')
	var_battery=$(acpi | grep "Battery 0" | awk -F "," '{print $2}' | xargs)
	var_memory=$(free | awk '/Mem/ {printf "%.2f GiB", $3 / 1048576.0}')
	var_wifi=$bool_wifi_name

	wifi_speed=$(awk 'NR==3 {print $4}' /proc/net/wireless | awk -F "." '{print $1}')

	icon_battery=" "
	icon_wifi="󰤨"
	icon_time=""
	icon_date=""
	icon_temp=""
	icon_memory=" "

  if [ -n "$bool_wifi_name" ]; then
    if [ -n "$bool_internet_check" ];then
      if [ "$wifi_speed" -ge -50 ]; then
        icon_wifi="󰤨"
      elif [ "$wifi_speed" -ge -60 ] && [ "$wifi_speed" -le -51 ]; then
        icon_wifi="󰤥"
      elif [ "$wifi_speed" -ge -70 ] && [ "$wifi_speed" -le -61 ]; then
        icon_wifi="󰤢"
      elif [ "$wifi_speed" -le -71 ]; then
        icon_wifi="󰤟"
      fi
    else 
      if [ "$wifi_speed" -ge -50 ]; then
        icon_wifi="󰤩"
      elif [ "$wifi_speed" -ge -60 ] && [ "$wifi_speed" -le -51 ]; then
        icon_wifi="󰤦"
      elif [ "$wifi_speed" -ge -70 ] && [ "$wifi_speed" -le -61 ]; then
        icon_wifi="󰤣"
      elif [ "$wifi_speed" -le -71 ]; then
        icon_wifi="󰤠"
      fi
    fi
	else
		icon_wifi="󰤮"
		var_wifi=$bool_network
	fi

	if [ -n "$bool_charging" ]; then
		icon_battery=""
	else
		if [ "$bool_battery_check" -ge 80 ]; then
			icon_battery=" "
		elif [ "$bool_battery_check" -lt 80 ] && [ "$bool_battery_check" -ge 60 ]; then
			icon_battery=" "
		elif [ "$bool_battery_check" -lt 60 ] && [ "$bool_battery_check" -ge 40 ]; then
			icon_battery=" "
		elif [ "$bool_battery_check" -lt 40 ] && [ "$bool_battery_check" -ge 20 ]; then
			icon_battery=" "
		elif [ "$bool_battery_check" -lt 20 ]; then
			icon_battery=""
		fi
	fi

	while [ -z "$bool_charging" ] && [ "$bool_battery_check" -lt 20 ]; do
		bool_charging=$(acpi | grep Charging)
		bool_battery_check=$(acpi | grep "Battery 0" | awk -F "%" '{print $1}' | awk -F "," '{print $2}')
		var_time=$(date +"%H:%M")
		var_date=$(date +"%a %d-%m-%y")
		var_temp=$(acpi -t | awk '{print $4}')
		var_battery=$(acpi | grep "Battery 0" | awk -F "," '{print $2}')
		var_memory=$(free | awk '/Mem/ {printf "%.2f GiB", $3 / 1048576.0}')
		bool_wifi_name=$(nmcli | grep wlo1: | awk '{print $4}')
		var_wifi=$bool_wifi_name
		if [ -n "$bool_charging" ]; then
			break
		fi
		dwm -s " $icon_time $var_time  $icon_date $var_date  $icon_wifi $var_wifi  $icon_memory $var_memory  $icon_temp $var_temp  $icon_battery $var_battery "
		send_notification
		sleep 45s
	done
	dwm -s " $icon_time $var_time  $icon_date $var_date  $icon_wifi $var_wifi  $icon_memory $var_memory  $icon_temp $var_temp  $icon_battery $var_battery "
	sleep 3s
done
