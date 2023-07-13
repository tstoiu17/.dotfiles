typeset -U path PATH
path=(~/.local/bin ~/.config/emacs/bin $path)
export PATH
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export READER="zathura"
export BROWSER="firefox"
export LESS='-R'
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
echo "source ~/.zshenv"
