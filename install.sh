#!/bin/bash

# install package manager
sh <(curl -L https://nixos.org/nix/install) --daemon

nix-env -iA
    # GUI stuff
    nixpkgs.i3          \
    nixpkgs.alacritty   \
    nixpkgs.warpd       \
    nixpkgs.gromit-mpx  \
    # SHELL stuff
    nixpkgs.zsh         \
    nixpkgs.git         \
    nixpkgs.lazygit     \
    nixpkgs.stow        \
    nixpkgs.bat         \
    nixpkgs.exa         \
    nixpkgs.visidata    \
    nixpkgs.tmux        \
    nixpkgs.neovim      \
    nixpkgs.du-dust     \
    nixpkgs.qmk         \
    nixpkgs.taskwarrior \
    nixpkgs.vit         \
    nixpkgs.zathura     \
    nixpkgs.sxiv        \
    nixpkgs.starship    \


