#!/bin/bash

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
upload_speed_icon=$(tmux_get '@tmux_power_upload_speed_icon' '')
download_speed_icon=$(tmux_get '@tmux_power_download_speed_icon' '')
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
show_upload_speed="$(tmux_get @tmux_power_show_upload_speed true)"
show_download_speed="$(tmux_get @tmux_power_show_download_speed true)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)

# short for Theme-Colour
TC=$(tmux_get '@tmux_power_theme' 'snow')
case $TC in
'gold')
	TC='#ffb86c'
	;;
'redwine')
	TC='#b34a47'
	;;
'moon')
	TC='#00abab'
	;;
'forest')
	TC='#228b22'
	;;
'violet')
	TC='#9370db'
	;;
'snow')
	TC='#fffafa'
	;;
'coral')
	TC='#ff7f50'
	;;
'sky')
	TC='#87ceeb'
	;;
'default') # Useful when your term changes colour dynamically (e.g. pywal)
	TC='colour3'
	;;
esac

G01=#444444 #238
G02=#626262 #241
G03=#767676 #243
G04=#000000 #244
G05=#181616 #255
G06=#0d0c0c #246
G07=#d3d3d3 #247
G08=#000000FF #248

FG="$G02"
BG="$G04"

# Status options
tmux_set status-interval 1
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$G08"
tmux_set status-attr none

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "$G04"
tmux_set @prefix_highlight_bg "$TC"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_copy_mode_attr "fg=$G04,bg=$TC,bold"

#     
# Left side of status bar
tmux_set status-left-bg "$TC"
tmux_set status-left-fg "$G03"
tmux_set status-left-length 150
user=$(whoami)
LS="#[fg=$G04,bg=$TC,bold] $user_icon $user@#h #[fg=$TC,bg=$G06,nobold]$right_arrow_icon#[fg=$TC,bg=$G06] $session_icon #S "
if "$show_upload_speed"; then
	LS="$LS#[fg=$G06,bg=$G06]$right_arrow_icon#[fg=$TC,bg=$G06] $upload_speed_icon #{upload_speed} #[fg=$G06,bg=$BG]$right_arrow_icon"
else
	LS="$LS#[fg=$G06,bg=$BG]$right_arrow_icon"
fi
if [[ $prefix_highlight_pos == 'L' || $prefix_highlight_pos == 'LR' ]]; then
	LS="$LS#{prefix_highlight}"
fi
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$G08"
tmux_set status-right-fg "$G03"
tmux_set status-right-length 150
RS="#[fg=$TC,bg=$G04]$left_arrow_icon"
if "$show_download_speed"; then
	RS="#[fg=$G06,bg=$BG]$left_arrow_icon#[fg=$TC,bg=$G06] $download_speed_icon #{download_speed} $RS"
fi
if [[ $prefix_highlight_pos == 'R' || $prefix_highlight_pos == 'LR' ]]; then
	RS="#{prefix_highlight}$RS"
fi
tmux_set status-right "$RS"

# Window status
tmux_set window-status-format "#[fg=$G07] #I:#W#F "
tmux_set window-status-current-format "#[fg=$TC,bold] #I:#W#F"

# Window separator
tmux_set window-status-separator ""

# Window status alignment
tmux_set status-justify left

# Current window status
tmux_set window-status-current-statys "fg=$TC,bg=$BG"

# Pane border
tmux_set pane-border-style "fg=$G01,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=$BG"

# Pane number indicator
tmux_set display-panes-colour "$G01"
tmux_set display-panes-active-colour "$TC"

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$FG"
