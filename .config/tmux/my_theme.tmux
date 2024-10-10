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
session_icon="$(tmux_get '@tmux_session_icon' '')"

White=#ffffff
Black=#000000
Color1=#0c0c0c
Color2=#000000ff
Normal_color=#e5ddc5
Normal_session_color=#bed7dc
Prefix_color=#91ff40
Accent_color=$(tmux_get '@tmux_theme' "#{?client_prefix,$Prefix_color,$Normal_color}")
Session_color=$(tmux_get '@tmux_theme' "#{?client_prefix,$Prefix_color,$Normal_session_color}")

tmux_set mode-style "bg=$Accent_color,fg=$Color1,bold"

tmux_set status on
tmux_set status-fg "$White"
tmux_set status-bg "$Color2"

LEFT_SIDE="#[fg=$Black,bg=$Session_color] $session_icon #S #[fg=default,bg=default] "
tmux_set status-left-length 150
tmux_set status-left "$LEFT_SIDE"

tmux_set status-right-length 150
tmux_set status-right "$RIGHT_SIDE"

tmux_set window-status-format "#[fg=$Accent_color,bg=$Color1] #I.#W#F "
tmux_set window-status-current-format "#[fg=$Black,bg=$Accent_color,bold] #I.#W#F "
tmux_set window-status-separator " "

tmux_set pane-border-style "fg=$White,bg=default"
tmux_set pane-active-border-style "fg=$Accent_color,bg=default"

tmux_set display-panes-colour "$White"
tmux_set display-panes-active-colour "$Accent_color"

tmux_set message-style "fg=$Accent_color,bg=default, bold"
:mux_set message-command-style "fg=$Accent_color,bg=default"
tmux_set mode-style "bg=$Accent_color,fg=$Color1"
