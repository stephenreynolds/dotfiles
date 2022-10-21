local awful = require("awful")
local gears = require("gears")

local increase_volume = function()
    awful.spawn.easy_async_with_shell(
        "pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \\([0-9][0-9]*\\)%.*,\\1,'",
        function(stdout)
            local volume = tonumber(stdout)
            local new_volume = volume + 5
            if new_volume > 100 then new_volume = 100 end
            os.execute("pactl set-sink-volume 0 " .. tostring(new_volume) .. "%")
            awesome.emit_signal("volume_change")
        end
    )
end

local decrease_volume = function()
    awful.spawn.easy_async_with_shell(
        "pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \\([0-9][0-9]*\\)%.*,\\1,'",
        function(stdout)
            local volume = tonumber(stdout)
            local new_volume = volume - 5
            if new_volume < 0 then new_volume = 0 end
            os.execute("pactl set-sink-volume 0 " .. tostring(new_volume) .. "%")
            awesome.emit_signal("volume_change")
        end
    )
end

local mute_volume = function()
    os.execute("pactl set-sink-mute 0 toggle")
    awesome.emit_signal("volume_change")
end

local play_pause = function() os.execute("playerctl play-pause") end

local audio_prev = function() os.execute("playerctl previous") end

local audio_next = function() os.execute("playerctl next") end

local print_screen  = function() awful.spawn.with_shell("gnome-screenshot -f \"$HOME/Pictures/Screenshots/Screenshot from $(date +'%Y-%m-%d %H-%M-%S').png\"") end

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() main_menu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))

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

-- Keybinding definitions
return {
    -- Media keys
    {{}, "XF86AudioRaiseVolume", increase_volume},
    {{}, "XF86AudioLowerVolume", decrease_volume},
    {{}, "XF86AudioMute", mute_volume },
    {{}, "XF86AudioPlay", play_pause },
    {{}, "XF86AudioPrev", audio_prev },
    {{}, "XF86AudioNext", audio_next },

    -- Print screen
    {{ modkey }, "Print", print_screen }
}
