local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

awesome_menu = {
    { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Edit config", editor_cmd .. " " .. awesome.conffile },
    { "Restart", awesome.restart },
    { "Quit", function() awesome.quit() end }
}

user_menu = {
  { "Lock", function() end },
  { "Log Out", function() awesome.quit() end },
  { "Reboot", function() awesome.spawn("systemctl reboot") end },
  { "Shut down", function() awesome.spawn("systemctl poweroff") end }
}

main_menu = awful.menu({
    items = {
        { "Awesome", awesome_menu },
        { "User", user_menu },
        { "Terminal", terminal },
        { "Firefox", "firefox" }
    }
})

return main_menu
