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
fpath+=$ZDOTDIR/.zfunc

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

autoload -Uz edit-command-line
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N edit-command-line
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
bindkey -M vicmd v edit-command-line
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

bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}

m() {
    # if arguments were passed
    if [ "$#" = 0 ]; then
        nvim '+Telescope man_pages'
    else
        man $*
    fi
}
# }}}
# {{{ aliases
alias rc="nvim $ZDOTDIR/.zshrc; exec zsh"
alias e='exit'
alias eza='eza --group-directories-first --sort=extension --icons=auto'
alias ls='eza'
alias l='ls -l'
alias cl='c;l'
alias c='clear'
alias ll='ls -laa'
alias t='eza --tree'
alias t2='eza --tree --level 2'
alias cat='bat'
alias g='lazygit'
alias v='nvim'
alias vo="nvim '+Telescope oldfiles'"
alias h='history'
alias n='nnn'  # see $NNN_OPTS in .zshenv
alias o="xdg-open"
alias d="edit_dotfiles"
alias t="tmuxp_load"
alias p="pass"
alias pc="pass -c"
alias z='zathura --fork'
alias x="xrandr"
alias ..="cd .."
alias -- -="cd -"

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
alias clipo="xclip -selection c -o"
alias ts="tmux_sessionizer"
alias td="tmux_dotfiles"
alias clip2png="xclip -selection clipboard -t image/png -o >"
alias pptx2pdf="soffice --headless --convert-to pdf"
alias tree="tree -C"
alias wm="$EDITOR ~/.config/i3/config"
alias nf="neofetch"
alias pacman="pacman --config $HOME/.config/pacman.conf"
alias paru="paru --bottomup --config $HOME/.config/pacman.conf"
alias i="paru -S"
alias py="python"
alias ipy="ipython"
alias tldr="o https://tldr.inbrowser.app"
alias nerd="o https://www.nerdfonts.com/cheat-sheet"
alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"
alias ip="ip -color=auto"
alias ex="exercism"
alias pytest="pytest --no-header"

# git aliases
alias gst="git status --short --branch"
alias gc="git commit -v"
alias ga="git add"
alias gb="git branch"

alias ff="firefox"
alias caps="setxkbmap -option caps:escape"
# }}}
# {{{ setup third-party tools
eval "$(starship init zsh)"
#  vvvvvvvvv  this checks if current shell options contains 'i' (interactive)
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
eval "$(direnv hook zsh)"
# TODO: fix this plugin overriding the fzf CTRL-R history search
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
[ -f "/home/tudor/.ghcup/env" ] && source "/home/tudor/.ghcup/env"
# }}}

