#/usr/bin/env bash

BROWSER=$(xdg-mime query default "x-scheme-handler/https")

case $BROWSER in
"zen.desktop")
    zen-browser --private-window
    ;;
"io.github.zen_browser.zen.desktop")
    flatpak run io.github.zen_browser.zen --private-window
    ;;
"firefox.desktop")
    firefox --private-window
    ;;
esac
