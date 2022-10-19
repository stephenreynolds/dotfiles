local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local main_menu = require("widgets.main-menu")
local menubar = require("widgets.menubar")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))

-- Keybindings
globalkeys = gears.table.join(
    -- Show help
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),

    -- Return to the previous tag
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
        { description = "go back", group = "tag" }),

    -- Focus by index
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.byidx(1)
        end,
        { description = "focus previous by index", group = "client" }
    ),

    -- Main menu
    awful.key({ modkey }, "w", function() main_menu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Prompt
    awful.key({ modkey }, "r", function () awful.screen.focused().promptbox:run() end,
        {description = "run prompt", group = "launcher"}),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
        {description = "show the menubar", group = "launcher"}),

    -- Layout manipulation
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),
    awful.key({ modkey, "Control" }, "Tab", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "Tab", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    -- Open a terminal
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),

    -- Reload AwesomeWM
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),

    -- Change width of master
    awful.key({ modkey }, "l", function() awful.tag.incmwfact(0.02) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.02) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Control" }, "Right", function() awful.tag.incmwfact(0.02) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey, "Control" }, "Left", function() awful.tag.incmwfact(-0.02) end,
        { description = "decrease master width factor", group = "layout" }),

    -- Change number of master clients
    awful.key({ modkey, "Mod1" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Mod1" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),

    -- Change number of columns
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),

    -- Restore minimized client
    awful.key({ modkey, "Control" }, "m",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Application launcher
    awful.key({ modkey }, "space", function() awful.util.spawn("rofi -modi drun,run -show drun -show-icons") end,
        { description = "show rofi", group = "launcher" }),

    -- Media keys
    awful.key({}, "XF86AudioRaiseVolume", function() os.execute("pactl set-sink-volume 0 +5%") end),
    awful.key({}, "XF86AudioLowerVolume", function() os.execute("pactl set-sink-volume 0 -5%") end),
    awful.key({}, "XF86AudioMute", function() os.execute("pactl set-sink-mute 0 toggle") end),
    awful.key({}, "XF86AudioPlay", function() os.execute("playerctl play-pause") end),
    awful.key({}, "XF86AudioPrev", function() os.execute("playerctl previous") end),
    awful.key({}, "XF86AudioNext", function() os.execute("playerctl next") end),

    -- Print screen
    awful.key({ modkey }, "Print",
        function() awful.spawn.with_shell("gnome-screenshot -f \"$HOME/Pictures/Screenshots/Screenshot from $(date +'%Y-%m-%d %H-%M-%S').png\"") end)
)

clientkeys = gears.table.join(
    -- Toggle gaps
    awful.key({ modkey }, "g", function(c)
        if c.screen.selected_tag.gap > 0 then
            c.screen.selected_tag.gap = 0
            for _, cl in pairs(c.screen.clients) do
                cl.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
            end
        else
            c.screen.selected_tag.gap = beautiful.useless_gap
            for _, cl in pairs(c.screen.clients) do
                cl.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
            end
        end
    end,
        { description = "toggle gaps", group = "client" }),

    -- Toggle fullscreen
    awful.key({ modkey, "Control" }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),

    -- Close window
    awful.key({ modkey }, "q", function(c) c:kill() end,
        { description = "close", group = "client" }),

    -- Toggle floating window
    awful.key({ modkey }, "f", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),

    -- Make window master
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),

    -- Toggle keep on top
    awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),

    -- Maximize window
    awful.key({ modkey }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),

    -- Minimize window
    awful.key({ modkey, "Shift" }, "m",
        function(c)
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),

    -- Toggle titlebars
    awful.key({ modkey, "Control" }, "Tab", awful.titlebar.toggle,
        { description = "toggle titlebars", group = "client" }),

    -- Move focus by direction
    awful.key({ modkey }, "Left",
        function(c)
            awful.client.focus.bydirection("left")
        end,
        { description = "move focus left", group = "client" }),
    awful.key({ modkey }, "Right",
        function(c)
            awful.client.focus.bydirection("right")
        end,
        { description = "move focus right", group = "client" }),
    awful.key({ modkey }, "Up",
        function(c)
            awful.client.focus.bydirection("up")
        end,
        { description = "move focus up", group = "client" }),
    awful.key({ modkey }, "Down",
        function(c)
            awful.client.focus.bydirection("down")
        end,
        { description = "move focus down", group = "client" }),

    -- Swap windows by direction using hjkl keys
    awful.key({ modkey, "Shift" }, "h",
        function(c)
            awful.client.swap.global_bydirection("left")
        end,
        { description = "swap with left client", group = "client" }),
    awful.key({ modkey, "Shift" }, "l",
        function(c)
            awful.client.swap.global_bydirection("right")
        end,
        { description = "swap with right client", group = "client" }),
    awful.key({ modkey, "Shift" }, "j",
        function(c)
            awful.client.swap.global_bydirection("down")
            c:raise()
        end,
        { description = "swap with down client", group = "client" }),
    awful.key({ modkey, "Shift" }, "k",
        function(c)
            awful.client.swap.global_bydirection("up")
            c:raise()
        end,
        { description = "swap with up client", group = "client" }),

    -- Swap windows by direction using arrow keys
    awful.key({ modkey, "Shift" }, "Left",
        function(c)
            awful.client.swap.global_bydirection("left")
        end,
        { description = "swap with left client", group = "client" }),
    awful.key({ modkey, "Shift" }, "Right",
        function(c)
            awful.client.swap.global_bydirection("right")
        end,
        { description = "swap with right client", group = "client" }),
    awful.key({ modkey, "Shift" }, "Down",
        function(c)
            awful.client.swap.global_bydirection("down")
            c:raise()
        end,
        { description = "swap with down client", group = "client" }),
    awful.key({ modkey, "Shift" }, "Up",
        function(c)
            awful.client.swap.global_bydirection("up")
            c:raise()
        end,
        { description = "swap with up client", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end),
    awful.button({}, 1, function(c)
        if not c.floating then
            return
        end

        client.focus = c
        c:raise()

        -- Only use bottom left/right corner, because dragging titlebar is already mapped to move
        local corners = {
            { c.x + c.width, c.y + c.height },
            { c.x, c.y + c.height },
        }

        local m = mouse.coords()
        local distance = 20

        for _, pos in ipairs(corners) do
            if math.sqrt((m.x - pos[1]) ^ 2 + (m.y - pos[2]) ^ 2) <= distance then
                awful.mouse.client.resize(c)
                break
            end
        end
    end)
)

-- Set keys
root.keys(globalkeys)
