#/usr/bin/env bash

active=$(hyprctl activeworkspace -j)
monitor=$(echo "$active" | jaq -r ".monitorID")
workspaces=$(hyprctl workspaces -j)
empty=$(echo "$active" | jaq -r ".windows == 0")
if [[ $empty == "true" ]]; then
    workspaces_on_monitor=$(echo "$workspaces" | jaq -r "map(select(.monitorID == $monitor and .id != -99))")
    only_workspace=$(echo "$workspaces_on_monitor" | jaq -r "length == 1")
    if [[ $only_workspace == "false" ]]; then
        hyprctl dispatch workspace previous
    fi
else
    id=$(echo "$workspaces" | jaq -r "max_by(.id).id + 1")
    hyprctl dispatch workspace $id
fi
