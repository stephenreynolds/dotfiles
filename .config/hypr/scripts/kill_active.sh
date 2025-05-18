#!/usr/bin/env bash

# Get all the information we need in a single hyprctl call
active_window=$(hyprctl activewindow -j)
active_class=$(echo "$active_window" | jaq -r ".class")
workspace_id=$(echo "$active_window" | jaq -r '.workspace.id')

# Get all clients and check if this is the last window on the workspace in one operation
clients_json=$(hyprctl clients -j)
window_count=$(echo "$clients_json" | jaq -r "[.[] | select(.workspace.id == $workspace_id)] | length")

# Determine if this is the last window
last_window=false
if [ "$window_count" -eq 1 ]; then
    last_window=true
fi

# Handle window closing based on class
case "$active_class" in
"discord")
    xdotool getactivewindow windowunmap
    hyprctl dispatch killactive ""
    ;;
*)
    hyprctl dispatch killactive
    ;;
esac

# If this was the last window on the workspace, switch to the previous workspace
if [ "$last_window" = true ] && [ "$workspace_id" -ne -99 ]; then
    hyprctl dispatch workspace m-1
fi
