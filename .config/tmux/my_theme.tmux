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
LS="#[fg=$G04,bg=$TC,bold] $user_icon $user@#h #[fg=$TC,bg=$G06] $session_icon #S "
if [ $prefix_highlight_pos = 'L' ] || [ $prefix_highlight_pos = 'LR' ]; then
	LS="$LS#[fg=$G04,bg=$TC,bold]#{prefix_highlight}"
fi
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$G08"
tmux_set status-right-fg "$G03"
tmux_set status-right-length 150
if [ $prefix_highlight_pos = 'R' ] || [ $prefix_highlight_pos = 'LR' ]; then
	RS="#[fg=$G04,bg=$TC,bold]#{prefix_highlight}"
fi
tmux_set status-right "$RS"

# Window status
tmux_set window-status-format "#[fg=$G07] #I:#W#F "
tmux_set window-status-current-format "#[fg=$TC,bold] #I:#W#F"

# Window separator
tmux_set window-status-separator "|"

# Window status alignment
tmux_set status-justify left

# Pane border
tmux_set pane-border-style "fg=$G01,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=default"

# Pane number indicator
tmux_set display-panes-colour "$G01"
tmux_set display-panes-active-colour "$TC"

# Message
tmux_set message-style "fg=$TC,bg=default, bold"

# Command message
tmux_set message-command-style "fg=$TC,bg=default"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$FG"
