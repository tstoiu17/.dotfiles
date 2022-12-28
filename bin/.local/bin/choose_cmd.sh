#!/bin/sh

if [ -e ./.cmds ]; then
    CMD=$(cat .cmds | fzf)
    $CMD
else
    echo "No .cmds file"
fi
