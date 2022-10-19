local theme_name = "custom"

local filesystem = require("gears.filesystem")
local icons_path = filesystem.get_configuration_dir() .. "/icons/"
local themes_path = filesystem.get_configuration_dir() .. "/theme/" .. theme_name .. "/"
local dpi = require("beautiful.xresources").apply_dpi

-- Main
local theme = {}

-- Styles
theme.font = "SF Pro Display Medium 10"

-- Colors
theme.accent     = "#F2D57E"
theme.secondary  = "#F28D8D"
theme.tertiary   = "#1F788C"
theme.light      = "#074973"
theme.dark       = "#031226"

theme.fg_normal  = "#DCDCDC"
theme.fg_focus   = "#ddd"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#000000cc"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#000000cc"
theme.bg_systray = theme.bg_normal

-- Borders
theme.border_width  = 0
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"

-- Gaps
theme.useless_gap = dpi(5)
--theme.gap_single_client = false

-- Titlebars
theme.titlebar_bg_focus  = "#000000cc"
theme.titlebar_bg_normal = "#000000cc"
theme.titlebar_fg_normal = "#bbb"
theme.titlebar_fg_focus  = "#ddd"
theme.titlebar_bg_terminal = "#000"

theme.wibar_bg = "#000000cc"
theme.wibar_fg = "#ddd"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = "#ffffff25"

-- Tasklist
theme.tasklist_bg_normal = "#00000000"
theme.tasklist_bg_focus = "#ffffff15"

-- Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"

-- Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]

-- Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- Icons
-- Taglist
theme.taglist_squares_sel   = themes_path .. "taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"

-- Misc
theme.awesome_icon           = icons_path .. "gentoo-logo.svg"
theme.menu_submenu_icon      = icons_path .. "submenu.png"

-- Layout
theme.layout_tile       = themes_path .. "layouts/tile.png"
theme.layout_tileleft   = themes_path .. "layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "layouts/fairv.png"
theme.layout_fairh      = themes_path .. "layouts/fairh.png"
theme.layout_spiral     = themes_path .. "layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "layouts/dwindle.png"
theme.layout_max        = themes_path .. "layouts/max.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "layouts/magnifier.png"
theme.layout_floating   = themes_path .. "layouts/floating.png"
theme.layout_cornernw   = themes_path .. "layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "layouts/cornerse.png"

-- Titlebar
theme.titlebar_close_button_focus  = themes_path .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png"

-- System tray
theme.systray_icon_spacing = dpi(10)

local awesome_overrides = function(theme) end

return {
    theme = theme,
    awesome_overrides = awesome_overrides
}
