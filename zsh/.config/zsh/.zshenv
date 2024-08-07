typeset -U path PATH
path=(~/.local/bin ~/.config/emacs/bin $path)
export PATH
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export READER="zathura"
export BROWSER="firefox"
export LESS='-R'
export NNN_OPTS='A'
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
. "$HOME/.cargo/env"
