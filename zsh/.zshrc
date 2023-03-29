export READER="zathura"
export BROWSER="google-chrome"
export EDITOR="nvim"
export LESS='-R'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export NIX_PAGER=batcat

# zsh stuff
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
plugins=(git)

eval "$(starship init zsh)"

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}

# vi mode
bindkey -v
KEYTIMEOUT=1
