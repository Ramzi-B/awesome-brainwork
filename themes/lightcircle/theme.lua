-------------------------------------------------------
-- Lightcircle Awesome WM theme | github.com/Ramzi-B --
-------------------------------------------------------

local gears                                         = require("gears")
local wibox                                         = require("wibox")
local awful                                         = require("awful")
local dpi                                           = require("beautiful.xresources").apply_dpi
local gfs                                           = require("gears.filesystem")
local my_table                                      = awful.util.table or gears.table
local surface                                       = gears.surface.load_from_shape

local theme                                         = {}
-- theme.confdir                                    = gfs.get_xdg_config_home() .. "awesome/themes/lightcircle"
theme.confdir                                       = gfs.get_configuration_dir() .. "themes/lightcircle"
theme.wallpaper                                     = theme.confdir .. "/wallpaper/background.jpg"

theme.font                                          = "TerminessTTFNerdFontMono 9.5"
theme.icon_theme                                    = "Papirus-Dark"
theme.useless_gap                                   = dpi(4)

theme.bg_normal                                     = "#222222AA"
theme.bg_focus                                      = "#333333"
theme.bg_urgent                                     = "#ff0000"
theme.bg_minimize                                   = "#444444"
theme.bg_systray                                    = theme.bg_normal
theme.systray_icon_spacing                          = dpi(3)

theme.fg_normal                                     = "#aaaaaa"
theme.fg_focus                                      = "#ffffff"
theme.fg_urgent                                     = "#ffffff"
theme.fg_minimize                                   = "#ffffff"

theme.border_width                                  = dpi(1)
theme.border_normal                                 = "#333333AA"
theme.border_focus                                  = "#535d6c"
theme.border_marked                                 = "#91231c"

-- theme.taglist_bg_focus                              = theme.bg_normal
theme.taglist_bg_focus                              = theme.bg_normal
theme.taglist_fg_focus                              = theme.bg_urgent

theme.tasklist_disable_icon                         = false

theme.awesome_icon                                  = theme.confdir .. "/icons/awesome.png"
theme.arch_icon                                     = theme.confdir .. "/icons/arch.png"

theme.menu_submenu_icon                             = theme.confdir .. "/icons/submenuplay.png"
theme.menu_height                                   = dpi(16)
theme.menu_width                                    = dpi(120)
theme.menu_border_width                             = dpi(0)

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

theme.taglist_squares_sel                           = surface(dpi(10), dpi(2), gears.shape.rectangle, theme.fg_focus) 
theme.taglist_squares_unsel                         = surface(dpi(10), dpi(2), gears.shape.rectangle, theme.bg_minimize) 

-- Widget
-- Create a textclock widget
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font = "TerminessTTFNerdFontMono bold 10.5"

-- Launcher
local mylauncher = awful.widget.button({ image = theme.arch_icon })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

function theme.when_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
        awful.button({ }, 1, function() awful.layout.inc( 1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end),
        awful.button({ }, 4, function() awful.layout.inc( 1) end),
        awful.button({ }, 5, function() awful.layout.inc(-1) end)
    ))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", height = dpi(18), screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end

return theme
