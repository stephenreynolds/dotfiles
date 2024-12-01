#/usr/bin/env bash

active=$(hyprctl activeworkspace -j)
monitor=$(echo "$active" | jaq -r ".monitorID")
workspaces=$(hyprctl workspaces -j)
workspaces_on_monitor=$(echo "$workspaces" | jaq -r "map(select(.monitorID == $monitor and .id != -99))")

last_id=$(echo "$workspaces_on_monitor" | jaq -r "max_by(.id).id")
should_move=$(echo "$active" | jaq -r ".id != $last_id or .windows > 1")
if [[ $should_move == "true" ]]; then
    hyprctl --batch "dispatch movetoworkspace $last_id ; dispatch movetoworkspace r+1"
fi
