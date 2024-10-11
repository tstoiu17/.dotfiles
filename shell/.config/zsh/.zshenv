typeset -U path PATH
path=(~/.local/bin ~/.config/emacs/bin $path)
export PATH
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export EDITOR='nvim'
export NVIM_APPNAME='lazy.nvim'
export MANPAGER='nvim +Man!'
export READER="zathura"
export BROWSER="firefox"
export LESS='-R'
export NNN_OPTS='A'
