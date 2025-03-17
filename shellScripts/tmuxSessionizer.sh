#!/bin/sh

path=$(zoxide query -l | fzf --reverse)
if [ -z "$path" ]; then
	exit 0
fi

i=1
flag=0
dir_name=$(echo "$path" | awk -F "/" '{print $NF}')

tmux has-session -t "${dir_name}_${i}" 2>/dev/null

if [ $? -eq 0 ]; then
	flag=1
fi

while [ $flag -eq 1 ]; do
	i=$((i + 1))
	tmux has-session -t "${dir_name}_${i}" 2>/dev/null
	if [ $? -eq 1 ]; then
		flag=0
	fi
done

session_name="${dir_name}_${i}"
if [ -z "$TMUX" ]; then
	tmux new -s "$session_name" -c "$path"
	exit 0
fi
tmux new -ds "$session_name" -c "$path"
tmux switch-client -t "$session_name"
