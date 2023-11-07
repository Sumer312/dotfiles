#!/bin/bash
# Script name: dm-sounds
# Description: Choose a ambient background sound to play.
# Dependencies: dmenu, fzf, rofi, mpv
# Need some ambient sound files?  Here are 15 sounds you can download:
# https://gitlab.com/dtos/etc/dtos-dmscripts/-/tree/main/etc/dtos/.config/dmscripts/dmsounds
# Create the directory $HOME/.config/dmscripts/dmsounds
# Place the sound files in this directory
# NOTE: DTOS automatically makes this directory and installs sound files for you.

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

# shellcheck disable=SC1091
source ./_dm-helper.sh 2>/dev/null || source _dm-helper.sh 2>/dev/null

source_dmscripts_configs

if configs_are_different; then
    echo "$(date): configs are different" >>"$DM_CONFIG_DIFF_LOGFILE"
    sleep 1
fi

main() {
    # Check if sounds_dir is a real directory
    # shellcheck disable=SC2154
    [ ! -d "${sounds_dir}" ] && err "The dm-sounds folder could not be found.
Place your sounds in:  ${sounds_dir}
Here are 15 sounds that you can download:
https://gitlab.com/dtos/etc/dtos-dmscripts/-/tree/main/etc/dtos/.config/dmscripts/dmsounds"
    # Produces a listing of the sound files.
    # shellcheck disable=SC2154
    readarray -t _sounds_list < <(find "${sounds_dir}" \( -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.ogg" \) -printf '%P\n')

    echo "${_sounds_list[*]}"

    # An array of options to choose.
    local _options=(
        "Choose sound file"
        "Play random sound"
        "Stop sound player"
        "Quit"
    )

    # Piping the _options array into dmenu.
    # We use "printf '%s\n'" to format the array one item to a line.
    choice=$(printf '%s\n' "${_options[@]}" | ${MENU} 'Ambient sounds:')

    if [ "$choice" == "Choose sound file" ]; then
        # Piping the soundList array into dmenu.
        # We use "printf '%s\n'" to format the array one item to a line.
        choice=$(printf '%s\n' "${_sounds_list[@]}" | sort | ${MENU} 'Choose sound file:')
        # Kill PID saved in cache file.
        kill "$(cat "$HOME/.cache/dmsounds")" || echo "mpv was not running."
        # Play the chosen sound file.
        # shellcheck disable=SC2154
        mpv --no-video --loop "$sounds_dir/$choice" >/dev/null 2>&1 &
        # Get PID for the above command and write to cache.
        _pid=$!
        echo "$_pid" >"$HOME/.cache/dmsounds"

    elif [ "$choice" == "Play random sound" ]; then
        get_rand=$(printf '%s\n' "${_sounds_list[@]}" | shuf -n 1)
        # Kill PID saved in cache file.
        kill "$(cat "$HOME/.cache/dmsounds")" || echo "mpv was not running."
        # Play random sound file.
        mpv --no-video --loop "$sounds_dir/$get_rand" >/dev/null 2>&1 &
        # ffplay -nodisp -loop 0 "$sounds_dir/$get_rand" &
        # Get PID for the above command and write to cache.
        _pid=$!
        echo "$_pid" >"$HOME/.cache/dmsounds"

    elif [ "$choice" == "Stop sound player" ]; then
        kill "$(cat "$HOME/.cache/dmsounds")" || echo "mpv was not running."

    else
        echo "Program terminated." && exit 0
    fi
}

MENU="$(get_menu_program "$@")"
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main
