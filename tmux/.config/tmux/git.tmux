set base-index 0
# git icons:  
new-window -S -t 0 -n "" lazygit
bind -N "Select git window" -n M-g select-window -t 0
select-window -t 0
set -w window-status-current-format "#[fg=orange]#W"
set -w window-status-format "#W"
last-window
# vim: set ft=tmux :
