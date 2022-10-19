local awful = require("awful")
local top_panel = require("layout.top-panel")
require("widgets.volume-adjust")

awful.screen.connect_for_each_screen(
    function(s)
        s.top_panel = top_panel(s)
    end
)
