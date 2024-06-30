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

C1=#ffffff   #238
C2=#0c0c0c   #244
C3=#0c0c0c   #244
C4=#000000ff #248
NC=#fffdd0
PFX=#0FFF50
TC=$(tmux_get '@tmux_power_theme' "#{?client_prefix,$PFX,$NC}")

tmux_set mode-style "bg=$TC,fg=$C3,bold"

tmux_set status on
tmux_set status-fg "$C1"
tmux_set status-bg "$C4"

user=$(whoami)
LS="#[fg=$C3,bg=$TC,bold] $user_icon $user@#h #[fg=$TC,bg=$C3] $session_icon #S #[fg=default,bg=default] "
tmux_set status-left-length 150
tmux_set status-left "$LS"

tmux_set status-right-length 150
tmux_set status-right "$RS"

tmux_set window-status-format "#[fg=$TC,bg=$C2] #I.#W#F "
tmux_set window-status-current-format "#[fg=$C3,bg=$TC,bold] #I.#W#F "
tmux_set window-status-separator " "

tmux_set pane-border-style "fg=$C1,bg=default"
tmux_set pane-active-border-style "fg=$TC,bg=default"

tmux_set display-panes-colour "$C1"
tmux_set display-panes-active-colour "$TC"

tmux_set message-style "fg=$TC,bg=default, bold"
:mux_set message-command-style "fg=$TC,bg=default"
tmux_set mode-style "bg=$TC,fg=$C3"
