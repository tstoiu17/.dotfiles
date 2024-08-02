#!/usr/bin/env bash

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "$HOME/.dotfiles doesn't exist"
    exit 1
fi

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.local/"
pushd "$HOME/.dotfiles" > /dev/null || exit

echo "Begin stowing"
for dir in */; do
    if [ -d "$dir" ]; then
        stow --restow "$dir"
        echo "[ $? ] $dir"
    fi
done

# machine dependent dotfiles
stow --delete X
ln -s "X/.xinitrc.$(hostname)" "$HOME/.xinitrc"

popd > /dev/null || exit
