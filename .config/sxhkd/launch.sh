#!/bin/sh

# Terminate already running instance
killall -q sxhkd

# Wait until the process has been shut down
while pgrep -u $UID -x sxhkd > /dev/null; do sleep 1; done

# Launch sxhkd
sxhkd &

echo "sxhkd launched.
