#/usr/bin/env bash

gaps_out=$(hyprctl -j getoption general:gaps_out | jaq -r '.custom' | awk '{print $1}')
gaps_in=$(hyprctl -j getoption general:gaps_in | jaq -r '.custom' | awk '{print $1}')

if [[ $gaps_out -eq 0 ]]; then
    gaps_out=10
    rounding=10
    state="enabled"
else
    gaps_out=0
    rounding=0
    state="disabled"
fi

if [[ $gaps_in -eq 0 ]]; then
    gaps_in=5
else
    gaps_in=0
fi

hyprctl --batch "keyword general:gaps_out $gaps_out ; keyword general:gaps_in $gaps_in ; keyword decoration:rounding $rounding"
