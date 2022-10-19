local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

-- Time
time_textclock = wibox.widget {
    format = "%l:%M %p",
    widget = wibox.widget.textclock
}

-- Date
date_textclock = wibox.widget {
    format = "%a %b %d",
    widget = wibox.widget.textclock
}

-- Combine time and date into one widget
text_clock = {
    {
        layout = wibox.layout.fixed.horizontal,
        wibox.container.place(date_textclock, "center", "center"),
        wibox.container.place(time_textclock, "center", "center")
    },
    left = dpi(8),
    right = dpi(8),
    widget = wibox.container.margin
}

return text_clock
