local awful = require("awful")
local menubar = require("menubar")

awful.util.shell = 'sh'

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = os.getenv("BROWSER") or "firefox"

-- Default modkey.
modkey = "Mod4"

-- Set the terminal for applications that require it.
menubar.utils.terminal = terminal
