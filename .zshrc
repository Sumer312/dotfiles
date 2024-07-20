# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias lock="/home/sumer/shellScripts/lock.sh"
alias toggleascii="/home/sumer/shellScripts/toggleAscii.sh"
alias tt="tt -theme harper"
alias audio="mpv --no-video"
alias ls="lsd -lF"
alias cat="batcat"

# Flatpak
alias firefox="flatpak run org.mozilla.firefox"

#Packages
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/autojump/autojump.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down
bindkey '^ ' autosuggest-accept

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export PATH=$PATH:/usr/local/go/bin
export PASSWORD_STORE_DIR=/home/sumer/.password-store
export PASSWORD_STORE_CLIP_TIME=25
export LANG="en_IN.utf8"
# export PATH=$PATH:$GOPATH/bin
# colorscript -r
