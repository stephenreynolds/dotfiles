local awful = require("awful")
local beautiful = require("beautiful")
local main_menu = require("widgets.main-menu")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local launcher = {
    awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = main_menu
    }),
    margins = dpi(6),
    widget = wibox.container.margin
}

return launcher
