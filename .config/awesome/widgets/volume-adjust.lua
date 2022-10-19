local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local offsety = dpi(200)
local icon_dir = gears.filesystem.get_configuration_dir() .. "/icons/volume/"

local volume_icon = wibox.widget {
    id = "container",
    {
        id = "image",
        widget = wibox.widget.imagebox
    },
    left = dpi(4),
    widget = wibox.container.margin
}

-- create the volume_adjust component
local volume_adjust = wibox({
    width = dpi(38),
    height = offsety,
    shape = gears.shape.rounded_rect,
    visible = false,
    ontop = true,
    bg = beautiful.bg_normal
})

local volume_bar = wibox.widget {
    widget = wibox.widget.progressbar,
    shape = gears.shape.rounded_bar,
    color = "#efefefcc",
    background_color = beautiful.bg_focus,
    max_value = 100,
    value = 0
}

volume_adjust:setup {
    id = "first",
    layout = wibox.layout.align.vertical,
    {
        wibox.container.margin(
            volume_bar, dpi(9), dpi(12), dpi(12), dpi(12)
        ),
        forced_height = offsety * 0.75,
        direction = "east",
        layout = wibox.container.rotate
    },
    wibox.container.margin(volume_icon),
    {
        id = "margin",
        {
            id = "volume_text",
            align = "center",
            widget = wibox.widget.textbox
        },
        bottom = 6,
        widget = wibox.container.margin
    }
}

-- create a 4 second timer to hide the volume adjust
-- component whenever the timer is started
local hide_volume_adjust = gears.timer {
    timeout = 4,
    autostart = true,
    callback = function()
        volume_adjust.visible = false
    end
}

-- show volume-adjust when "volume_change" signal is emitted
awesome.connect_signal("volume_change",
    function()
        -- set new volume value
        awful.spawn.easy_async_with_shell(
            "pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \\([0-9][0-9]*\\)%.*,\\1,'"
            ,
            function(stdout)
                local volume_level = tonumber(stdout)
                volume_bar.value = volume_level
                volume_adjust.first.margin.volume_text:set_markup(tostring(volume_level) .. "%")

                if (volume_level > 40) then
                    volume_icon.image:set_image(icon_dir .. "volume.png")
                elseif (volume_level > 0) then
                    volume_icon.image:set_image(icon_dir .. "volume-low.png")
                else
                    volume_icon.image:set_image(icon_dir .. "volume-off.png")
                end

                volume_adjust.screen = awful.screen.focused()
                volume_adjust.x = volume_adjust.screen.geometry.width + dpi(20)
                volume_adjust.y = 0 + dpi(42)
            end,
            false
        )

        -- make volume_adjust component visible
        if volume_adjust.visible then
            hide_volume_adjust:again()
        else
            volume_adjust.visible = true
            hide_volume_adjust:start()
        end
    end
)
