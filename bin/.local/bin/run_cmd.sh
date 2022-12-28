#!/bin/bash

choice=""

while [[ "$choice" != "q" ]]
do
    clear
    echo "Running: $*"
    $*
    read -n1 -r -s -p "" choice
done
