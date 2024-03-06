#!/bin/sh
# https://wiki.archlinux.org/title/Laptop/Lenovo#Battery_conservation_mode

file=/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode

if [ "$(cat $file)" -eq 1 ]; then
    echo 0 | sudo tee "$file"
    notify-send "Conservation OFF" \
        --icon="$HOME/.local/share/icons/battery_charging_36x36.png" \
        -h string:bgcolor:#800000
    echo "Conservation OFF"
else
    echo 1 | sudo tee "$file"
    notify-send "Conservation ON" \
        --icon="$HOME/.local/share/icons/battery_charging_36x36.png" \
        -h string:bgcolor:#008000
    echo "Conservation ON"
fi
