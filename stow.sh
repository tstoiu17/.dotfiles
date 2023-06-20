#!/bin/bash

mkdir -p "$HOME/.config"

stow -vv --restow alacritty
stow -vv --restow bin
stow -vv --restow gromit-mpx
stow -vv --restow i3
stow -vv --restow lazygit
stow -vv --restow mpv
stow -vv --restow nvim
stow -vv --restow starship
stow -vv --restow tmux
stow -vv --restow warpd
stow -vv --restow X
stow -vv --restow zathura
stow -vv --restow zsh
