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
nv() {
    cd "$XDG_CONFIG_HOME/nvim"
    nvim
    cd - > /dev/null
}

bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}

m() {
    # if arguments weren't passed
    if [ "$#" = 0 ]; then
        nvim '+Telescope man_pages'
    else
        man $*
    fi
}

ns() {
    xdg-open "https://search.nixos.org/packages?query=$1"
}
# }}}
# {{{ aliases
alias rc="nvim $ZDOTDIR/.zshrc; exec zsh"
alias e='exit'
if command -v eza &> /dev/null; then
    alias eza='eza --group-directories-first --sort=extension --icons=never'
    alias ls='eza'
    alias lt='eza --tree --level 1'
    alias ltt='eza --tree --level 2'
fi
alias l='ls -l'
alias cl='c;l'
alias c='clear'
alias ll='ls -laa'
alias cat='batcat'
alias g='lazygit'
alias v='nvim'
alias vo="nvim '+Telescope oldfiles'"
alias h='history'
alias n='nnn'
alias o="xdg-open"
alias d="edit_dotfiles"
alias t="tmuxp_load"
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
alias nf="neofetch"
alias py="python"
alias ipy="ipython"
alias tldr="o https://tldr.inbrowser.app"
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
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
#  vvvvvvvvv  this checks if current shell options contains 'i' (interactive)
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi
# TODO: fix this plugin overriding the fzf CTRL-R history search
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
[ -f "/home/tudor/.nix-profile/share/fzf/key-bindings.zsh" ] && source "/home/tudor/.nix-profile/share/fzf/key-bindings.zsh"
[ -f "/home/tudor/.ghcup/env" ] && source "/home/tudor/.ghcup/env"
# }}}

