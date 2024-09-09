#!/bin/sh

# $1: option
# $2: default value
tmux_get() {
	local value="$(tmux show -gqv "$1")"
	[ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option
# $2: value
tmux_set() {
	tmux set-option -gq "$1" "$2"
}

# Options
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"

color1=#ffffff   #238
color2=#0c0c0c   #244
color3=#000000ff #248
normal_color=#f1eedc
Prefix_color=#d1df39
Accent_color=$(tmux_get '@tmux_power_theme' "#{?client_prefix,$Prefix_color,$normal_color}")

tmux_set mode-style "bg=$Accent_color,fg=$color2,bold"

tmux_set status on
tmux_set status-fg "$color1"
tmux_set status-bg "$color3"

user=$(whoami)
LS="#[fg=$color2,bg=$Accent_color,bold] $user_icon $user@#h #[fg=$Accent_color,bg=$color2] $session_icon #S #[fg=default,bg=default] "
tmux_set status-left-length 150
tmux_set status-left "$LS"

tmux_set status-right-length 150
tmux_set status-right "$RS"

tmux_set window-status-format "#[fg=$Accent_color,bg=$color2] #I.#W#F "
tmux_set window-status-current-format "#[fg=$color2,bg=$Accent_color,bold] #I.#W#F "
tmux_set window-status-separator " "

tmux_set pane-border-style "fg=$color1,bg=default"
tmux_set pane-active-border-style "fg=$Accent_color,bg=default"

tmux_set display-panes-colour "$color1"
tmux_set display-panes-active-colour "$Accent_color"

tmux_set message-style "fg=$Accent_color,bg=default, bold"
:mux_set message-command-style "fg=$Accent_color,bg=default"
tmux_set mode-style "bg=$Accent_color,fg=$color2"
