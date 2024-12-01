#/usr/bin/env bash

case $(hyprctl activewindow -j | ${jaq} -r ".class") in
"discord")
    xdotool getactivewindow windowunmap
    hyprctl dispatch killactive ""
    ;;
*)
    hyprctl dispatch killactive
    ;;
esac
