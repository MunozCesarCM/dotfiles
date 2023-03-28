#!/bin/sh

while true; do
    # Initial padding
    statusbar=" "

    # CPU
    #CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
    #statusbar="$statusbar$(printf "CPU %s | " "$CPU")"

    # RAM used
    MEM=$(free -h | grep Mem)
    MEMUSED=$(echo $MEM | awk '{print $3}')
    #MEMUTOT=$(echo $MEM | awk '{print $2}')
    statusbar="$statusbar$(printf " %s | " "$MEMUSED")"

    # Battery
    BAT=$(acpi | awk '{print $4}' | sed 's/.$//')
    DIS=$(acpi | awk '{print $3}')
    if [ "$DIS" != "Discharging," ]; then
        statusbar="$statusbar$(printf " [%s] | " "$BAT")"
    else
        statusbar="$statusbar$(printf " %s | " "$BAT")"
    fi

    # Internet connection
    ONLINE=$(ip a | grep DOWN | wc -l)
    if [ "$ONLINE" != "0" ]; then
        statusbar="$statusbar$(printf "睊 | ")"
    else
        statusbar="$statusbar$(printf " | ")"
    fi

    # Show tasks to be completed if amount > 0
    TASK=$(cat ~/documents/text/todo | grep "^*" | wc -l | awk '{print $1}')
    if [ "$TASK" != "0" ]; then
        statusbar="$statusbar$(printf " %s | " "$TASK")"
    fi

    # Date and time
    # statusbar="$statusbar$(printf "%s" "$(date "+%I:%M:%S ")")"
    statusbar="$statusbar$(printf "%s" "$(date "+%R ")")"

    # End padding
    statusbar="$statusbar "

    xsetroot -name "$statusbar"
    sleep 5s
done
