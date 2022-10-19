local beautiful = require("beautiful")
local gtable = require("gears.table")

-- Default theme
local default_theme = require("theme.default-theme")

-- Chosen theme
local theme = require("theme.custom")

-- Use the default theme as a base and override with the chosen theme
local final_theme = {}
gtable.crush(final_theme, default_theme.theme)
gtable.crush(final_theme, theme.theme)
default_theme.awesome_overrides(final_theme)
theme.awesome_overrides(final_theme)

-- Use the final theme
beautiful.init(final_theme)
