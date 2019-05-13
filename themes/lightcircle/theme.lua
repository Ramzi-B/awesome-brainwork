-------------------------------------------------------
-- Lightcircle Awesome WM theme | github.com/Ramzi-B --
-------------------------------------------------------

local gears            = require("gears")
local wibox            = require("wibox")
local dpi              = require("beautiful.xresources").apply_dpi
local gfs              = require("gears.filesystem")

local theme            = {}
-- theme.confdir          = gfs.get_xdg_config_home() .. "awesome/themes/lightcircle"
theme.confdir          = gfs.get_configuration_dir() .. "themes/lightcircle"
theme.wallpaper        = theme.confdir .. "/wallpaper/background.jpg"

theme.font             = "TerminessTTFNerdFontMono 9"
theme.icon_theme       = "/usr/share/icons/Papirus-Dark" 
theme.useless_gap      = dpi(4)

theme.bg_normal        = "#222222AA"
theme.bg_focus         = "#333333"
theme.bg_urgent        = "#ff0000"
theme.bg_minimize      = "#444444"
theme.bg_systray       = theme.bg_normal

theme.fg_normal        = "#aaaaaa"
theme.fg_focus         = "#ffffff"
theme.fg_urgent        = "#ffffff"
theme.fg_minimize      = "#ffffff"

theme.border_width     = dpi(1)
theme.border_normal    = "#000000"
theme.border_focus     = "#535d6c"
theme.border_marked    = "#91231c"

theme.taglist_bg_focus = theme.bg_minimize
theme.taglist_fg_focus = theme.bg_urgent

theme.awesome_icon                                  = theme.confdir .. "/icons/awesome.png"
theme.arch_icon                                     = theme.confdir .. "/icons/arch.png"

theme.menu_submenu_icon                             = theme.confdir .. "/icons/submenuplay.png"
theme.menu_height                                   = dpi(15)
theme.menu_width                                    = dpi(100)

theme.titlebar_close_button_normal                  = theme.confdir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus                   = theme.confdir .. "/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal               = theme.confdir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus                = theme.confdir .. "/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive         = theme.confdir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive          = theme.confdir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active           = theme.confdir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active            = theme.confdir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive        = theme.confdir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive         = theme.confdir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active          = theme.confdir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active           = theme.confdir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive      = theme.confdir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive       = theme.confdir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active        = theme.confdir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active         = theme.confdir .. "/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive     = theme.confdir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive      = theme.confdir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active       = theme.confdir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active        = theme.confdir .. "/titlebar/maximized_focus_active.png"

theme.layout_fairh                                  = theme.confdir .. "/layouts/fairhw.png"
theme.layout_fairv                                  = theme.confdir .. "/layouts/fairvw.png"
theme.layout_floating                               = theme.confdir .. "/layouts/floatingw.png"
theme.layout_magnifier                              = theme.confdir .. "/layouts/magnifierw.png"
theme.layout_max                                    = theme.confdir .. "/layouts/maxw.png"
theme.layout_fullscreen                             = theme.confdir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom                             = theme.confdir .. "/layouts/tilebottomw.png"
theme.layout_tileleft                               = theme.confdir .. "/layouts/tileleftw.png"
theme.layout_tile                                   = theme.confdir .. "/layouts/tilew.png"
theme.layout_tiletop                                = theme.confdir .. "/layouts/tiletopw.png"
theme.layout_spiral                                 = theme.confdir .. "/layouts/spiralw.png"
theme.layout_dwindle                                = theme.confdir .. "/layouts/dwindlew.png"
theme.layout_cornernw                               = theme.confdir .. "/layouts/cornernww.png"
theme.layout_cornerne                               = theme.confdir .. "/layouts/cornernew.png"
theme.layout_cornersw                               = theme.confdir .. "/layouts/cornersww.png"
theme.layout_cornerse                               = theme.confdir .. "/layouts/cornersew.png"

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--    taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--    taglist_square_size, theme.fg_normal
-- )

return theme
