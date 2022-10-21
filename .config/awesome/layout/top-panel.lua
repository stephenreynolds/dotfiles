local awful = require("awful")
local wibox = require("wibox")
local clock = require("widgets.clock")
local launcher = require("widgets.launcher")
local layout_box = require("widgets.layout-box")
local taglist = require("widgets.taglist")
local tasklist = require("widgets.tasklist")
local tray = require("widgets.tray")
local modalawesome = require("modalawesome")

local top_panel = function(s)
    -- Create tags with predefined layouts
    local l = awful.layout.suit
    local layouts = {
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left,
        l.tile.left
    }
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, layouts)

    -- Prompt box
    s.promptbox = awful.widget.prompt()

    -- Layout box
    s.layoutbox = layout_box(s)

    -- Tag list
    s.taglist = taglist(s)

    -- Task list
    s.tasklist = tasklist(s)

    -- Create the panel
    local panel = awful.wibar({
        screen = s,
        position = "top"
    })

    panel:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            launcher,
            s.taglist,
            modalawesome.active_mode,
            s.promptbox
        },
        {
            -- Center widgets
            layout = wibox.layout.flex.horizontal,
            s.tasklist
        },
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            modalawesome.sequence,
            tray,
            clock,
            s.layoutbox
        }
    }

    return panel
end

return top_panel
