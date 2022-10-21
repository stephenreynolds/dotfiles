pcall(require, "luarocks.loader")
require("awful.autofocus")
local modalawesome = require("modalawesome")

-- Error handling
require("error-handling")

-- Theme
require("theme")

-- Variables
require("variables")

-- Keybindings
--require("keybindings")
modalawesome.init({
  modkey = modkey,
  modes = require("input.modes"),
  keybindings = require("input.keybindings")
})

-- Layouts
require("layouts")

-- Widget layout
require("layout")

-- Rules
require("rules")

-- Signals
require("signals")

-- Autostart
require("autostart")
