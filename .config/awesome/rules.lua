local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            size_hints_honor = false
        }
    },

    -- Floating clients.
    { rule_any = {
        class = {
            "Pavucontrol",
            "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        }
    }, properties = { floating = true } },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {
        type = {
            "normal",
            "dialog"
        }
    }, properties = {
        titlebars_enabled = true
    } },

    -- Add property to indicate window is a terminal
    { rule_any = {
        class = {
            "kitty",
            "st"
        }
    }, properties = {
        is_terminal = true
    }}
}
