export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export KEYTIMEOUT=1
bindkey -v
#setopt autocd
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
autoload -Uz compinit
compinit

### FUNCTIONS ###

### ALIASES ###
alias rc="nvim $ZDOTDIR/.zshrc; exec zsh"
alias e='exit'
alias c='clear'
alias cl='c;l'
alias ls='exa --group-directories-first'
alias l='ls -l'
alias ll='ls -laa'
alias cat='bat'
alias v='nvim'
alias h='history'
alias z='zathura --fork'
alias n='nnn -A -H'
alias d="edit-dotfiles"

# directory navigation
alias dot="cd ~/.dotfiles; cl"
alias bin="cd ~/.local/bin; cl"
alias dl="cd ~/dl; cl"
alias repos="cd ~/repos; cl"
alias docs="cd ~/docs; cl"
alias img="cd ~/img; cl"
alias dirs="dirs -v"

alias cx="chmod +x"
alias clip="xclip -selection c"
alias ts="tmux-sessionizer"
alias td="tmux-dotfiles"
alias clip2png="xclip -selection clipboard -t image/png -o >"
alias tree="tree -C"

alias edp="xrandr --output eDP --auto --output HDMI-A-0 --off"
alias hdmi="xrandr --output eDP --off --output HDMI-A-0 --auto"
alias wm="$EDITOR ~/.config/i3/config"
alias nf="neofetch"
alias i="sudo pacman -S"

eval "$(starship init zsh)"
