export HISTFILE=~/.zhistory
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
path+=(
    ~/.local/bin
    /mnt/c/Users/tudor/scoop/apps/mpv/current
    ~/.deno/bin
)

# resources:
# - https://github.com/rothgar/mastering-zsh
# - https://thevaluable.dev/zsh-install-configure-mouseless/

# options {{{
# source: https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands
# }}}

# completion {{{
fpath+=(
    ~/.nix-profile/share/zsh/site-functions/
)

autoload -Uz compinit && compinit
_comp_options+=(globdots) # complete hidden files
zstyle ':completion:*' menu yes select
# }}}

# keybinds {{{
bindkey -v
export KEYTIMEOUT=1
# source: https://thevaluable.dev/zsh-install-configure-mouseless/#changing-cursor
function vi_normal_mode_block_cursor_and_insert_mode_beam_cursor() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'
    function zle-keymap-select() {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }
    function zle-line-init() {
        echo -ne $cursor_beam
    }
    zle -N zle-keymap-select
    zle -N zle-line-init
}
vi_normal_mode_block_cursor_and_insert_mode_beam_cursor

repeat-last-command() {
  zle clear-screen
  zle up-history
  zle accept-line
}
zle -N repeat-last-command
bindkey '^o' repeat-last-command

autoload -Uz edit-command-line
zle -N edit-command-line

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
bindkey -- "${key[Backspace]}" backward-delete-char
bindkey -- "${key[Delete]}"    delete-char
bindkey -- "${key[Up]}"        up-line-or-history
bindkey -- "${key[Down]}"      down-line-or-history
bindkey -- "${key[Left]}"      backward-char
bindkey -- "${key[Right]}"     forward-char
bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
bindkey -M vicmd v edit-command-line
# }}}

# helper functions {{{
function exists() {
    command -v "$1" > /dev/null
}

function source_if_exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}
# }}}

# third-party tools {{{
exists starship && eval "$(starship init zsh)"
exists fzf && eval "$(fzf --zsh)"
exists direnv && eval "$(direnv hook zsh)"
# }}}

source_if_exists ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source_if_exists ~/.aliases

ns() {
    xdg-open "https://search.nixos.org/packages?query=$1"
}

# vim: ft=bash:foldmethod=marker


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/test1/.opam/opam-init/init.zsh' ]] || source '/home/test1/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
# eval "$(/home/test1/.local/bin/mise activate zsh)"
