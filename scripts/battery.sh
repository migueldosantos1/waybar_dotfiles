#!/bin/bash
# ── battery.sh ─────────────────────────────────────────────
# Description: Shows battery % with ASCII bar + dynamic tooltip
# Usage: Waybar `custom/battery` every 10s
# Dependencies: upower, awk, seq, printf
#  ──────────────────────────────────────────────────────────

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

# Get detailed info from upower
time_to_empty=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk -F: '/time to empty/ {print $2}' | xargs)
time_to_full=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk -F: '/time to full/ {print $2}' | xargs)

# Icons
charging_icons=()
default_icons=(         )

index=$((capacity / 25))
[ $index -ge 5 ] && index=4

if [[ "$status" == "Charging" ]]; then
    icon=""
elif [[ "$status" == "Full" ]]; then
    icon=""
else
    default_icons=(    )
    index=$((capacity / 21))
    [ $index -ge 5 ] && index=4
    icon=${default_icons[$index]}
fi

# ASCII bar
filled=$((capacity / 20))
empty=$((5 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

# Color thresholds
if [ "$capacity" -lt 20 ]; then
    fg="#834649"  # red
elif [ "$capacity" -lt 55 ]; then
    fg="#d7e6e7"  # orange
else
    fg="#d7e6e7"  # cyan
fi


# JSON output
# echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $capacity%</span>\",\"tooltip\":\"$tooltip\"}"
echo "{\"text\":\"<span foreground='$fg'>$icon  $capacity%</span>\",\"tooltip\":\"Status: $status\"}"