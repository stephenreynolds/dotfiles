local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

return {
    wibox.widget.systray(),
    margins = dpi(4),
    widget = wibox.container.margin
}
