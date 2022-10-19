local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

-- Disable rounded corners when window is maximized, fullscreen, or by itself
-- BUG: Does not work with a non-maximized window over a maximized one
function handle_maximized(c)
    --local single_client = c.screen.clients[2] == nil

    if c.maximized or c.fullscreen or (c.screen.selected_tag and c.screen.selected_tag.gap == 0) then
        c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
    else
        c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
    end
end

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    handle_maximized(c)
end)

client.connect_signal("property::maximized", function(c)
    handle_maximized(c)
end)

-- Double click titlebar to maximize
function double_click_event_handler()
    if double_click_timer then
        double_click_timer:stop()
        double_click_timer = nil
        return true
    end

    double_click_timer = gears.timer.start_new(0.20, function()
        double_click_timer = nil
        return false
    end)
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            -- Maximize on double click
            if double_click_event_handler() then
                c.maximized = not c.maximized
                c:raise()
            else
                awful.mouse.client.move(c)
            end
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    local bg_color = beautiful.titlebar_bg_normal
    local bg_color_focus = beautiful.titlebar_bg_focus

    if c.class == "kitty" then
        bg_color = beautiful.titlebar_bg_terminal
        bg_color_focus = beautiful.titlebar_bg_terminal
    end

    awful.titlebar(c, {
        bg_normal = bg_color,
        bg_focus = bg_color_focus
    }):setup {
        nil,
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Remove rounded borders if window is alone
client.connect_signal("focus", function(c)
    handle_maximized(c)
end)
client.connect_signal("unfocus", function(c)
    handle_maximized(c)
end)

-- Focus urgent clients automatically
client.connect_signal("property::urgent", function(c)
    c.minimized = false
    c:jump_to()
end)

