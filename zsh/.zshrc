export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export EDITOR='/home/tudor/.local/bin/lvim'
bindkey -v

########## ALIASES ########## 

alias ls="exa"
alias ll="ls -l"
alias py="python3"
alias wm="v ~/.config/i3/config"
alias wms="v ~/.config/i3/i3status/config"
alias nf="neofetch"
alias ff="firefox"
alias anime="ani-cli -q best -f" # best quality and use fzf for search results
alias ac="anime -c" # continue
alias cat="batcat"
alias cx="chmod +x"
alias clip="xclip -selection c"
alias laptop="autorandr laptop"

alias maxb="sudo brightnessctl set 255"
alias minb="sudo brightnessctl set 10"

alias ai="sudo apt install"
alias upd="sudo apt update"
alias rmrf="rm -rf"

alias lg="lazygit"

alias dot="cd ~/.dotfiles"
alias cm="cmatrix"
alias ab="monitor_above"
alias down="cd ~/Downloads/"

# single letter aliases
alias a="v ~/.zshrc; exec zsh"
alias b="sudo brightnessctl i"
alias c="clear"
#alias d=
alias e="exit"
#alias f=
#alias g=
#alias h=
#alias i=
#alias j=
#alias k=
alias l="ls -laa"
alias m="autorandr multi"
alias n="nnn"
#alias o=
#alias p=
#alias q=
#alias r=
#alias s=
alias t="tmux"
#alias u=

#alias v="nvim"
alias v="/home/tudor/.local/bin/lvim"

#alias w=
#alias x=
#alias y=
#alias z=

alias repos="cd ~/repos"
alias dl="cd ~/Downloads/"
alias grvw="gh repo view --web" # repo web view
alias va=". venv/bin/activate"
alias da="deactivate"

########## TMUX ########## 

alias ta="tmux attach -t" # -t requires a name so press TAB to select from active sessions
alias tk="tmux kill-session -t" # -t requires a name so press TAB to select from active sessions
alias ts="tmux-sessionizer"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')" # make a new tmux session in the current dir

eval "$(starship init zsh)"
