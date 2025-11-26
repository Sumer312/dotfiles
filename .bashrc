# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# if [ -f /usr/bin/fastfetch ]; then
#   fastfetch
# fi

# bash completions
# these provide completions for commands ig
# if ! shopt -oq posix; then
# 	if [ -f /usr/share/bash-completion/bash_completion ]; then
# 		. /usr/share/bash-completion/bash_completion
# 	elif [ -f /etc/bash_completion ]; then
# 		. /etc/bash_completion
# 	fi
# fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000
HISTFILE=~/.bash_history

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias lock="/home/sumer/shellScripts/lock.sh"
alias resume="flatpak run org.libreoffice.LibreOffice --writer ~/Documents/resumes/general_resume.odt"
alias hdmi="/home/sumer/shellScripts/displayScript.sh -h"
alias edp="/home/sumer/shellScripts/displayScript.sh -d"
alias tt="tt -theme harper"
alias audio="mpv --no-video"
alias ls="lsd -lFi"
alias cat="batcat"
alias lzg="lazygit"
alias lzd="lazydocker"
alias ff="fastfetch"
alias storagehealth="sudo nvme smart-log /dev/nvme0"
alias firefox="flatpak run org.mozilla.firefox"

# autoclean images
Daci() {
	none_images=$(docker images -a | grep "<none>" | awk '{print $3}')
	if [ -z "$none_images" ]; then
		echo "Nothing to clean"
	else
		docker rmi $none_images
	fi
}

Dres() {
	docker start $(docker ps -a | grep $1 | awk -F '   +' '{print $1}')
}

Dsa() {
	docker stop $(docker ps -q)
}

zt() {
	if [ -z "$1" ]; then
		path=$(zoxide query -i)
	else
		path=$(zoxide query -i "$1")
	fi
	if [ -z "$path" ]; then
		return
	fi

	dir_name=$(echo "$path" | awk -F "/" '{print $NF}')
	session_number=$(echo "$(tmux ls 2>/dev/null | wc -l) + 1" | bc)
	session_name=" $session_number | ${dir_name} "
	if [ -n "$TMUX" ]; then
		tmux new -ds "$session_name" -c "$path"
		tmux switch-client -t "$session_name"
	else
		tmux new -s "$session_name" -c "$path"
	fi
}

Gacpu_() {
	if [ -n "$1" ]; then
		git add . && git commit -m "$1" && git push --set-upstream origin $(git branch | grep \* | cut -c3-)
	else
		git add . && git commit -m "x" && git push --set-upstream origin $(git branch | grep \* | cut -c3-)
	fi
}

PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/GitClones/nvim/bin
export PATH=$PATH:$HOME/.local/share/pipx/venvs/jrnl/bin
export PATH=$PATH:$HOME/.cargo/bin
export LANG="en_IN.utf8"
export BROWSER=/usr/bin/librewolf
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export PASSWORD_STORE_DIR=$HOME/.password-store
export PASSWORD_STORE_CLIP_TIME=25
export EDITOR=/bin/vim
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#bed7dc,marker:#87ff00
  --color=prompt:#bed7dc,spinner:#e5ddc5,pointer:#e5ddc5,header:#87afaf
  --color=border:#707070,label:#aeaeae,query:#d9d9d9
  --border="sharp" --border-label="" --preview-window="border-sharp" --prompt="> "
  --marker=">" --separator="─" --scrollbar="│"
  --layout="reverse"'

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Midpath
# Docker
dk() {
	REPOROOT=$(git rev-parse --show-toplevel)
	FOLDER=actions
	if [ -d cicd ]; then
		FOLDER=cicd
	fi
	([ ! -z "$REPOROOT" ] && source $REPOROOT/$FOLDER/bashrc 2>/dev/null && $@)
}

dg() {
	docker ps | grep $1 | awk '{print $1}'
}

dps() {
	docker ps --format '{{.ID}}\t{{.Status}}\t{{.Names}}\t{{.Ports}}'
}

dat() {
	CMD=${2:-bash}
	docker exec -it $(dg $1) $CMD
}

dsh() {
	docker run --rm -it -v /tmp:/tmp -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/app --workdir /app --network host $@
}

dlf() {
	docker logs -f $(dg $1)
}

dre() {
	docker restart $(dg $1)
}

# Git
Gfresh() {
	REMOTE=${1:-origin}
	BRANCH=$(git branch | grep \* | awk '{print $2}')
	TRUNK=${2:-develop}
	echo "Current: $BRANCH"
	echo "Trunk  : $REMOTE/$TRUNK"
	git checkout $TRUNK
	git fetch $REMOTE $TRUNK
	git reset --hard $REMOTE/$TRUNK
	git checkout $BRANCH
	git merge $TRUNK
}

Gsync() {
	REMOTE=${1:-origin}
	current_branch=$(git branch | grep \* | awk '{print $2}')
	BRANCH=${2:-$current_branch}
	echo "Syncing: ${REMOTE}/${BRANCH}"
	git checkout $BRANCH
	git fetch $REMOTE
	git reset --hard $REMOTE/$BRANCH
}

alias Ga='git add'
alias Gs='git status'
alias Gl='git log --oneline'
alias Gd='git diff'
alias GacP='git add -Av && git commit && git push origin'
alias Gc='git commit'
alias Gac='git add -Av && git commit'
alias Gpu='git push '
alias Gck='git checkout'
alias Gck-='git checkout -- .'
alias Gckf='git checkout -f'
alias Gckb='git checkout -b'
Gpu_() {
	git push --set-upstream $@ origin $(git branch | grep \* | cut -c3-)
}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
