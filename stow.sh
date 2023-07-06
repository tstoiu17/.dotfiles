#!/bin/bash

mkdir -p "$HOME/.config"

for dir in */; do
    if [ -d $dir ]; then
        stow --restow $dir
        echo "[ $? ] $dir"
    fi
done
