#!/bin/bash

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.local/"

for dir in */; do
    if [ -d "$dir" ]; then
        stow --restow "$dir"
        echo "[ $? ] $dir"
    fi
done
