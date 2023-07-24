# {{{ settings
export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=1000000000 
export SAVEHIST=1000000000
export KEYTIMEOUT=1
autoload -Uz compinit
compinit
setopt HIST_IGNORE_DUPS
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' menu yes select

# }}}
# {{{ keybinds
bindkey -v

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
bindkey -- "${key[Home]}"      beginning-of-line
bindkey -- "${key[End]}"       end-of-line
bindkey -- "${key[Insert]}"    overwrite-mode
bindkey -- "${key[Backspace]}" backward-delete-char
bindkey -- "${key[Delete]}"    delete-char
bindkey -- "${key[Up]}"        up-line-or-history
bindkey -- "${key[Down]}"      down-line-or-history
bindkey -- "${key[Left]}"      backward-char
bindkey -- "${key[Right]}"     forward-char
bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
bindkey -- "${key[Up]}"        up-line-or-beginning-search
bindkey -- "${key[Down]}"      down-line-or-beginning-search
# }}}
# {{{ functions
pkgsync() {
    paru -S --needed - < $HOME/.dotfiles/pkglist.txt
}

pkgsave() {
    pacman -Qeq > $HOME/.dotfiles/pkglist.txt
}

pkgdiff() {
    nvim -d <(pacman -Qeq) $HOME/.dotfiles/pkglist.txt
}

nv() {
    cd "$XDG_CONFIG_HOME/nvim"
    nvim
    cd - > /dev/null
}
# }}}
# {{{ aliases
alias rc="nvim $ZDOTDIR/.zshrc; exec zsh"
alias e='exit'
alias c='clear'
alias cl='c;l'
alias ls='exa --group-directories-first'
alias l='ls -l'
alias ll='ls -laa'
alias cat='bat'
alias v='nvim'
alias vo="nvim '+Telescope oldfiles'"
alias h='history'
alias n='nnn -A -H'
alias o="xdg-open"
alias d="edit-dotfiles"
alias p="pass"
alias pc="pass -c"
alias z='zathura --fork'

# directory navigation
alias dot="cd ~/.dotfiles; cl"
alias bin="cd ~/.local/bin; cl"
alias dl="cd ~/dl; cl"
alias repos="cd ~/repos; cl"
alias docs="cd ~/docs; cl"
alias books="cd ~/books; cl"
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
alias pacman="pacman --config $HOME/.config/pacman.conf"
alias paru="paru --config $HOME/.config/pacman.conf"
alias i="paru -S"
alias py="python"
alias tldr="o https://tldr.inbrowser.app"
alias nerd="o https://www.nerdfonts.com/cheat-sheet"
# }}}
# {{{ setup third-party tools
eval "$(starship init zsh)"
#  ⬇️⬇️ ⬇️⬇️ ⬇️⬇️⬇️  this checks if current shell options contains 'i' (interactive)
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
source "/usr/share/fzf/key-bindings.zsh"
# }}}
