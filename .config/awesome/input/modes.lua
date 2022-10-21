local awful = require("awful")
local gears = require("gears")
local modes = require("modalawesome.modes")

-- Tag mode
modes.tag = gears.table.join({
    {
        description = "hide all visible clients until keypress",
        pattern = { 'd' },
        handler = function(mode)
            local tags_ = awful.screen.focused().selected_tags
            local grabber

            awful.tag.viewnone(awful.screen.focused())
            mode.grabber:stop()

            grabber = awful.keygrabber {
                autostart = true,
                keypressed_callback = function()
                    awful.tag.viewmore(tags_)
                    grabber:stop()
                    mode.grabber:start()
                end
            }
        end,
    },
    {
        description = "focus client by index",
        pattern = { '%d*', '[,.]' },
        handler = function(_, count, direction)
            count = count == '' and 1 or tonumber(count)

            if direction == '.' then
                awful.client.focus.byidx(count)
            else
                awful.client.focus.byidx(-count)
            end
        end
    }
}, modes.tag)

-- Launcher mode
modes.launcher = gears.table.join({
    {
        description = "run prompt",
        pattern = {"s"},
        handler = function() awful.screen.focused().promptbox:run() end
    },
    {
        description = "lua execute prompt",
        pattern = {"x"},
        handler = function()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().promptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end
    },
    {
        description = "launch browser",
        pattern = {"w"},
        handler = function() awful.spawn(browser) end
    }
}, modes.launcher)

return modes
