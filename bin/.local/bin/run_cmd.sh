#!/bin/bash

choice=""

while [[ "$choice" != "q" ]]
do
    clear
    echo -e "\e[32mRunning: $*\e[0m"
    "$@"
    read -n1 -r -s -p "" choice
done
