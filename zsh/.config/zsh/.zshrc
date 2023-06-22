export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export KEYTIMEOUT=1
bindkey -v
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

autoload -Uz compinit
compinit
#setopt autocd
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' menu yes select
# bind shift-tab to move selection in reverse
bindkey '^[[Z' reverse-menu-complete

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
alias py="python"

eval "$(starship init zsh)"
