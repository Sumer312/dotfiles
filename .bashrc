# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

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
alias tt="tt -theme harper"
alias audio="mpv --no-video"
alias ls="lsd -lFi"
alias cat="batcat"
alias lzg="lazygit"
alias ff="fastfetch"
alias storagehealth="sudo nvme smart-log /dev/nvme0"

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

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export PASSWORD_STORE_DIR=$HOME/.password-store
export PASSWORD_STORE_CLIP_TIME=25
export LANG="en_IN.utf8"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export EDITOR=/bin/vim

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
	docker ps --format '{{.ID}}\t{{.Status}}\t{{.Names}}'
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
Gpu_() { # push and set upstream to same name
	git push --set-upstream $@ origin $(git branch | grep \* | cut -c3-)
}
