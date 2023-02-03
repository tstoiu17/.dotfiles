export ZSH="$HOME/.oh-my-zsh"
export READER="zathura"
export BROWSER="google-chrome"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export EDITOR="nvim"
export LESS='-R'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
bindkey -v
KEYTIMEOUT=1

########## ALIASES ########## 

alias ls="exa"
alias ll="ls -laa"
alias py="python3"
alias python="python3"
alias wm="v ~/.config/i3/config"
alias wms="v ~/.config/i3/i3status/config"
alias nf="neofetch"
alias ff="firefox"
alias cat="batcat"
alias cx="chmod +x"
alias clip="xclip -selection c"
alias laptop="autorandr laptop"

alias maxb="sudo brightnessctl set 255"
alias minb="sudo brightnessctl set 10"

alias sai="sudo apt install"
alias upd="sudo apt update"
alias rmrf="rm -rf"

alias gg="lazygit"

alias dot="cd ~/.dotfiles"
alias cm="cmatrix"
alias ab="monitor_above"
alias down="cd ~/Downloads/"

# single letter aliases
alias a="v ~/.zshrc; exec zsh"
alias b="sudo brightnessctl i"
alias c=" clear"
alias d="date +%r | figlet -t -f 'ANSI Shadow'"
alias e="exit"
#alias f=
#alias g=
alias h="history"
#alias i=
# alias j=
#alias k=
alias l="exa --long"
alias am="autorandr multi"
alias al="autorandr lib"
alias n="nnn"
#alias o=
#alias p=
alias q="qalc"
alias r="/home/tudor/.local/bin/choose_cmd.sh"
#alias s=
alias t="tmux"
#alias u=
# alias v="/home/tudor/.local/bin/lvim"
alias v="nvim"
#alias w=
#alias x=
#alias y=
alias z='zathura --fork'

alias cl="clear;l"
alias rp="/home/tudor/.local/bin/run_cmd.sh python3"
alias dl="cd ~/dl/"
alias img="cd ~/img"
alias repos="cd ~/repos"
alias grvw="gh repo view --web" # repo web view
alias vc="python3 -m venv venv"
alias va=". venv/bin/activate"
alias pir="pip install -r requirements.txt"
alias vde="deactivate"

########## TMUX ########## 

alias tk="tmux kill-session -t" # -t requires a name so press TAB to select from active sessions
alias ts="tmux-sessionizer"
alias td="tmux-dotfiles"
alias tn="tmux new-session -s $(pwd | sed 's/.*\///g') -c $(pwd)" # make a new tmux session in the current dir
alias jl="jupyter lab"

eval "$(starship init zsh)"

# Load Angular CLI autocompletion.
source <(ng completion script)
alias im="cd ~/img"

alias ipy="ipython --TerminalInteractiveShell.editing_mode=vi"
alias bt="bluetoothctl"
alias hg="history | grep"
alias say='figlet -t -f "ANSI Shadow"'
alias saybigger="figlet -t -f ~/.local/etc/figlet/doh.flf"

[ -f "/home/tudor/.ghcup/env" ] && source "/home/tudor/.ghcup/env" # ghcup-env
alias pptx2pdf="soffice --headless --convert-to pdf"

alias nv="v ~/.config/nvim/"
alias clip2png="xclip -selection clipboard -t image/png -o >"
alias za="z *.pdf"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}
