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
local shape                                         = gears.shape

--
local naughty                                       = require("naughty")

local theme                                         = {}
-- theme.confdir                                    = gfs.get_xdg_config_home() .. "awesome/themes/lightcircle"
theme.confdir                                       = gfs.get_configuration_dir() .. "themes/lightcircle"
theme.wallpaper                                     = theme.confdir .. "/wallpaper/background.jpg"

theme.font                                          = "TerminessTTFNerdFontMono 10"
theme.icon_theme                                    = "Papirus-Dark"

theme.colors                                        = {
    transparent  = "#00000000",
    red          = "#FF0000",
    orange       = "#FFA500",
    orangedark   = "#FF8C00",
    orangedarken = "#EF6C00",
    orangedeep   = "#FF3D00",
    silver       = "#C0C0C0",
    darkgray     = "#A9A9A9",
    bluegray     = "#263238",
    tealdarken   = "#004D40"
}

theme.bg_normal                                     = "#222222AA"
theme.bg_focus                                      = "#333333"
theme.bg_urgent                                     = theme.colors.red
theme.bg_minimize                                   = "#444444"

theme.fg_normal                                     = "#aaaaaa"
theme.fg_focus                                      = "#ffffff"
theme.fg_urgent                                     = "#ffffff"
theme.fg_minimize                                   = "#ffffff"

theme.border_normal                                 = "#333333AA"
theme.border_focus                                  = "#535d6c"
theme.border_marked                                 = "#91231c"
theme.border_width                                  = dpi(1)
theme.maximized_hide_border                         = true

theme.useless_gap                                   = dpi(5)
theme.gap_single_client                             = true

theme.bg_systray                                    = theme.bg_normal
theme.systray_icon_spacing                          = dpi(4)

theme.taglist_bg_focus                              = theme.colors.transparent
theme.taglist_fg_focus                              = theme.colors.orangedeep

theme.titlebar_bg                                   = "#2E3440"
theme.titlebar_bg_focus                             = "#2E3440"

theme.tasklist_disable_icon                         = false
theme.tasklist_plain_task_name                      = false
theme.tasklist_disable_task_name                    = true

theme.awesome_icon                                  = theme.confdir .. "/icons/awesome.png"
-- theme.arch_icon                                     = theme.confdir .. "/icons/arch.png"
theme.arch_icon                                     = theme.confdir .. "/icons/menu.svg"

theme.menu_submenu_icon                             = theme.confdir .. "/icons/submenuplay.png"
theme.menu_height                                   = dpi(16)
theme.menu_width                                    = dpi(120)
theme.menu_border_width                             = dpi(0)

theme.hotkeys_font                                  = "TerminessTTFNerdFontMono bold 12"
theme.hotkeys_description_font                      = "TerminessTTFNerdFontMono 10"
theme.hotkeys_shape                                 = shape.rounded_rect
theme.hotkeys_border_color                          = theme.border_focus
theme.hotkeys_border_width                          = dpi(2)
theme.hotkeys_group_margin                          = dpi(20)

theme.taglist_squares_sel                           = surface(dpi(5), dpi(5), shape.circle, theme.taglist_fg_focus)
-- theme.taglist_squares_sel                           = surface(dpi(25), dpi(4), shape.rounded_bar, theme.taglist_fg_focus)
theme.taglist_squares_unsel                         = surface(dpi(10), dpi(5), shape.rounded_bar, theme.bg_minimize)

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

theme.layout_fairh                                  = theme.confdir .. "/layouts/fairh.svg"
theme.layout_fairv                                  = theme.confdir .. "/layouts/fairv.svg"
theme.layout_floating                               = theme.confdir .. "/layouts/floating.svg"
theme.layout_magnifier                              = theme.confdir .. "/layouts/magnifier.svg"
theme.layout_max                                    = theme.confdir .. "/layouts/max.svg"
theme.layout_fullscreen                             = theme.confdir .. "/layouts/fullscreen.svg"
theme.layout_tilebottom                             = theme.confdir .. "/layouts/tilebottom.svg"
theme.layout_tileleft                               = theme.confdir .. "/layouts/tileleft.svg"
theme.layout_tile                                   = theme.confdir .. "/layouts/tile.svg"
theme.layout_tiletop                                = theme.confdir .. "/layouts/tiletop.svg"
theme.layout_spiral                                 = theme.confdir .. "/layouts/spiral.svg"
theme.layout_dwindle                                = theme.confdir .. "/layouts/dwindle.svg"
theme.layout_cornernw                               = theme.confdir .. "/layouts/cornernw.svg"
theme.layout_cornerne                               = theme.confdir .. "/layouts/cornerne.svg"
theme.layout_cornersw                               = theme.confdir .. "/layouts/cornersw.svg"
theme.layout_cornerse                               = theme.confdir .. "/layouts/cornerse.svg"

-- Widget
theme.widget_clock                                  = theme.confdir .. "/icons/clock.svg"

-- Create a textclock widget
os.setlocale(os.getenv("LANG"))
local clockicon   = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font  = "TerminessTTFNerdFontMono bold 9"

local clocktip = awful.tooltip {
    tooltip_font = theme.font,
    tooltip_bg   = theme.bg_normal
}
clocktip:add_to_object(mytextclock)
mytextclock:connect_signal('mouse::enter',
    function()
        clocktip.text = os.date('Date:\t\t %A %d %B %Y \nHeure:\t\t %T')
    end
)

-- Launcher
local mylauncher = awful.widget.button({ image = theme.arch_icon })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

--[[
-- Slider
local slider = wibox.widget {
    bar_shape           = gears.shape.rounded_rect,
    -- bar_margins         = dpi(1),
    handle_shape        = gears.shape.circle,
    -- handle_margins      = dpi(1),
    -- handle_width        = dpi(10),
    -- handle_border_width = dpi(1),
    -- handle_border_color = "#FF0000",
    -- opacity             = 1,
    forced_width        = dpi(45),
    bar_height          = dpi(1),
    value               = 100,
    widget              = wibox.widget.slider
}
--]]

function theme.on_screen_connect(s)

    -- test screen
    naughty.notify({ text = "Screen___" .. s.index })

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
        awful.button({ }, 1, function() awful.layout.inc(1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end),
        awful.button({ }, 4, function() awful.layout.inc(1) end),
        awful.button({ }, 5, function() awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        -- filter  = awful.widget.taglist.filter.all,
        filter  = awful.widget.taglist.filter.noempty,
        -- filter  = awful.widget.taglist.filter.selected,
        buttons = awful.util.taglist_buttons,
        --[[
        style = {
            shape = gears.shape.rounded_rect,
            shape_border_color = "#333333",
            shape_border_width = dpi(2)
        }
        --]]
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
    }

    --[[
    awful.popup {
        widget = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.allscreen,
            buttons = awful.util.tasklist_buttons,
            style = {
                shape = gears.shape.rounded_rect,
            },
            layout = {
                spacing = 5,
                forced_num_rows = 1,
                layout = wibox.layout.grid.horizontal
            },
            widget_template = {
                {
                    {
                        id = 'clienticon',
                        widget = awful.widget.clienticon,
                    },
                    margins = 4,
                    border_width = 1,
                    widget = wibox.container.margin,
                },
                id = 'background_role',
                forced_width = dpi(24),
                forced_height = dpi(24),
                widget = wibox.container.background,
                create_callback = function(self, c, index, objects)
                    self:get_children_by_id('clienticon')[1].client = c
                end,
            },
        },
        border_color = '#777777',
        border_width = dpi(2),
        ontop = true,
        placement = awful.placement.centered,
        shape = gears.shape.rounded_rect
    }
    --]]

    -- Create the wibox
    s.mywibox = awful.wibar({ screen = s,  position = "top", height = dpi(20) })

    -- Add widgets to the wibox
    s.mywibox:setup {
        -- Left widgets
        {
            layout = wibox.layout.fixed.horizontal,
            { -- mylauncher
                layout = wibox.container.background,
                bg     = theme.colors.bluegray,
                {
                    layout  = wibox.container.margin,
                    margins = dpi(4),
                    mylauncher,
                },
                shape              = shape.rounded_rect,
                shape_border_width = dpi(1),
                shape_border_color = theme.colors.bluegray,
            },
            s.mytaglist,
            s.mypromptbox
        },
        -- Middle widget
        { -- s.mytasklist
            layout = wibox.container.background,
            bg     = theme.colors.bluegray,
            {
                layout  = wibox.container.margin,
                margins = dpi(3),
                s.mytasklist,
            },
            shape              = shape.rounded_bar,
            shape_border_width = dpi(1),
            shape_border_color = theme.colors.bluegray,
        },
        -- Right widgets
        {
            layout = wibox.layout.fixed.horizontal,
            -- mykeyboardlayout,
            -- slider,
            -- wibox.widget.systray(),
            { -- systray
                layout = awful.widget.only_on_screen,
                screen = "primary" or 1, -- Only display on screen 1
                {
                    layout = wibox.container.background,
                    bg     = theme.colors.bluegray,
                    {
                        layout  = wibox.container.margin,
                        margins = dpi(3),
                        wibox.widget.systray(),
                    },
                    shape              = shape.rounded_bar,
                    shape_border_width = dpi(1),
                    shape_border_color = theme.colors.bluegray,
                }
            },
            { -- clockicon
                layout = awful.widget.only_on_screen,
                screen = "primary" or 1, -- Only display on screen 1
                {
                    layout = wibox.container.background,
                    bg     = theme.colors.bluegray,
                    {
                        layout  = wibox.container.margin,
                        margins = dpi(4),
                        clockicon,
                    },
                    shape              = shape.rounded_bar,
                    shape_border_width = dpi(1),
                    shape_border_color = theme.colors.bluegray,
                }
            },
            { -- mytextclock
                layout = awful.widget.only_on_screen,
                screen = "primary" or 1, -- Only display on screen 1
                {
                    layout = wibox.container.background,
                    bg     = theme.colors.bluegray,
                    {
                        layout  = wibox.container.margin,
                        margins = dpi(4),
                        mytextclock,
                    },
                    shape              = shape.rounded_bar,
                    shape_border_width = dpi(1),
                    shape_border_color = theme.colors.bluegray,
                },
            },
            { -- s.mylayoutbox
                layout = wibox.container.background,
                bg     = theme.colors.bluegray,
                {
                    layout  = wibox.container.margin,
                    margins = dpi(4),
                    s.mylayoutbox,
                },
                shape              = shape.rounded_bar,
                shape_border_width = dpi(1),
                shape_border_color = theme.colors.bluegray,
            }
        },
        layout = wibox.layout.align.horizontal, -- wlayout_aligh_h
    }

    --[[ -- really need ?
    s.mybottomwibox = awful.wibar(
        { screen = s, position = "bottom", height = dpi(16) }
    ) : setup {
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox,
        },
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            s.mylayoutbox
        },
        layout = wibox.layout.align.horizontal,
    }
    --]]
end

return theme
