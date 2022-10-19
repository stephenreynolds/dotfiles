local awful = require("awful")

-- Startup applications
awful.spawn.with_shell("/usr/libexec/polkit-gnome-authentication-agent-1")
awful.spawn.with_shell("picom --config $HOME/.config/picom/picom.conf --experimental-backends")
awful.spawn.with_shell("dunst --conf $HOME/.config/dunst/dunstrc")
awful.spawn.with_shell("numlockx on")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("ibus-daemon -drxR")
awful.spawn.with_shell("nm-applet")
