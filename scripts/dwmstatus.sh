#!/bin/sh

while true; do
    # Initial padding
    statusbar=" "

    # RAM used
    MEM=$(free -h | grep Mem)
    MEMUSED=$(echo $MEM | awk '{print $3}')
    statusbar="$statusbar$(printf "%s | " "$MEMUSED")"

    # Battery
    BAT=$(acpi | awk '{print $4}' | sed 's/.$//')
    DIS=$(acpi | awk '{print $3}')
    if [ "$DIS" != "Discharging," ]; then
        statusbar="$statusbar$(printf "[%s] | " "$BAT")"
    else
        statusbar="$statusbar$(printf "%s | " "$BAT")"
    fi

    # Internet connection
    ONLINE=$(ip a | grep DOWN | wc -l)
    if [ "$ONLINE" != "0" ]; then
        statusbar="$statusbar$(printf "▽ | ")"
    else
        statusbar="$statusbar$(printf "▲ | ")"
    fi

    # Time
    statusbar="$statusbar$(printf "%s" "$(date "+%R ")")"

    # End padding
    statusbar="$statusbar "

    xsetroot -name "$statusbar"
    sleep 5s
done
