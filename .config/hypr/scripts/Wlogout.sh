#!/bin/bash
# wlogout (Power, Screen Lock, Suspend, etc)

# Set variables for parameters. First numbers corresponts to Monitor Resolution
# i.e 2160 means 2160p
A_2160=700
B_2160=700
# A_1600=650
# B_1600=650
A_1600=250
B_1600=250
A_1440=450
B_1440=450
A_1080=350
B_1080=350
A_720=50
B_720=50

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Detect monitor resolution and scaling factor
width=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .width / .scale' | awk -F'.' '{print $1}')
resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

# Set parameters based on screen resolution and scaling factor
#
if ((width >= 3440)); then
    T_val=$(awk "BEGIN {printf \"%.0f\", $A_1440 * 1440 * $hypr_scale / $resolution}")
    B_val=$(awk "BEGIN {printf \"%.0f\", $B_1440 * 1440 * $hypr_scale / $resolution}")
    echo "Setting parameters for resolution ultrawide $T_val $B_val"
    wlogout --protocol layer-shell -b 4 -T $T_val -B $B_val &
elif ((width >= 2160)); then
    T_val=$(awk "BEGIN {printf \"%.0f\", $A_2160 * 2160 * $hypr_scale / $resolution}")
    B_val=$(awk "BEGIN {printf \"%.0f\", $B_2160 * 2160 * $hypr_scale / $resolution}")
    echo "Setting parameters for resolution >= 4k"
    wlogout --protocol layer-shell -b 4 -T $T_val -B $B_val &
elif ((width >= 1600 && width < 2160)); then
    T_val=$(awk "BEGIN {printf \"%.0f\", $A_1600 * 1600 * $hypr_scale / $resolution}")
    B_val=$(awk "BEGIN {printf \"%.0f\", $B_1600 * 1600 * $hypr_scale / $resolution}")
    echo "Setting parameters for resolution >= 2.5k and < 4k"
    wlogout --protocol layer-shell -b 4 -T $T_val -B $B_val &
elif ((width >= 1080 && width < 1440)); then
    T_val=$(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}")
    B_val=$(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}")
    echo "Setting parameters for resolution >= 1080p and < 2k"
    wlogout --protocol layer-shell -b 3 -T $T_val -B $B_val &
elif ((width >= 720 && width < 1080)); then
    T_val=$(awk "BEGIN {printf \"%.0f\", $A_720 * 720 * $hypr_scale / $resolution}")
    B_val=$(awk "BEGIN {printf \"%.0f\", $B_720 * 720 * $hypr_scale / $resolution}")
    echo "Setting parameters for resolution >= 720p and < 1080p"
    wlogout --protocol layer-shell -b 3 -T $T_val -B $B_val &
else
    echo "Setting default parameters"
    wlogout &
fi
