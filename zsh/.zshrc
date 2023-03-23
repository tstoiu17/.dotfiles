export READER="zathura"
export BROWSER="google-chrome"
export EDITOR="nvim"
export LESS='-R'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export NIX_PAGER=cat

# zsh stuff
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
plugins=(git)

source "$HOME/.aliases"

eval "$(starship init zsh)"

[ -f "~/.ghcup/env" ] && source "~/.ghcup/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}

# vi mode
bindkey -v
KEYTIMEOUT=1
