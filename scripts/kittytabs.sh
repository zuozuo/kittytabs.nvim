#!/bin/bash

# Get list of open kitty windows
windows=$(kitty @ ls | jq -r '.[].tabs[].windows[] | select(.is_focused == true) | .id')

# Check if any windows are open
if [ -z "$windows" ]; then
    echo "No kitty windows found"
    exit 1
fi

# Display window list with fzf for selection
selected=$(echo "$windows" | fzf --prompt="Select window: ")

# Switch to selected window
if [ -n "$selected" ]; then
    kitty @ focus-window --match id:$selected
fi
