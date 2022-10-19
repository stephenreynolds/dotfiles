#!/bin/zsh

# Keybindings
$HOME/.config/sxhkd/launch.sh &

# xrandr to configure display positions
$HOME/.config/scripts/xdisplays.sh &

# Policy kit
/usr/libexec/polkit-gnome-authentication-agent-1 &

# dunst
dunst -conf $HOME/.config/dunst/dunstrc &

# Picom for visual effects
picom --config $HOME/.config/picom/picom.conf --experimental-backends &

# Wallpaper
feh --bg-fill $HOME/Pictures/Wallpapers/forest.jpg &

# Polybar
$HOME/.config/polybar/launch.sh &

# Numlock
numlockx on &

# NetworkManager applet
nm-applet &

# Thunar Volume Manager
thunar --daemon &
