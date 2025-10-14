#!/bin/bash

IFS=$'\n\t'

# Define directories
waybar_styles="$HOME/.config/waybar/style"
waybar_style="$HOME/.config/waybar/style.css"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
rofi_config="$HOME/.config/rofi/config-waybar-style.rasi"

# Function to display menu options
menu() {
    find "$waybar_styles" -maxdepth 1 -name '*.css' -exec basename {} .css \; | sort
}

# Apply selected style
apply_style() {
    local style_file="$waybar_styles/$1.css"

    if [[ ! -f "$style_file" ]]; then
        echo "Error: Style '$1' not found."
        exit 1
    fi

    ln -sf "$style_file" "$waybar_style"
    exec "${SCRIPTSDIR}/Refresh.sh" &
}

# Main function
main() {
    choice=$(menu | rofi -i -dmenu -config "$rofi_config")

    [[ -z "$choice" ]] && echo "No option selected. Exiting." && exit 0

    apply_style "$choice"
}

# Kill only the oldest Rofi instance if running
if pgrep -x "rofi" >/dev/null; then
    pkill -o rofi
fi

main
