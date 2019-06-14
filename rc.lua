-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- {{{ Standard awesome library
local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local dpi           = beautiful.xresources.apply_dpi
local my_table      = awful.util.table or gears.table
local gfs           = gears.filesystem
-- local lain          = require("lain")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })

        in_error = false
    end)
end
-- }}}

-- Naughty defaults
-- naughty.config.defaults.screen    = 3
naughty.config.defaults.margin    = dpi(15)
naughty.config.defaults.icon_size = dpi(36)
-- naughty.config.defaults.position  = "top_middle"

-- {{{
naughty.notify({
    -- preset = naughty.config.presets.critical,
    title = "Alert!",
    text = "You're awesome",
    timeout = 10,
    icon         = beautiful.icon,
    bg           = beautiful.bg_normal,
    fg           = beautiful.fg_normal,
    font         = 'xos4 Terminus',
    margin       = dpi(40),
    border_width = dpi(4),
    border_color = "#00ff00" ,
    -- shape        = gears.shape.rounded_rect
    shape        = function(cr, w, h)
        return gears.shape.infobubble(cr, w, h, dpi(10), dpi(10), w/2 - dpi(10))
    end,
})

local text = [[ An <b>important</b>: <i>notification</i> ]]
naughty.notify({
    -- preset = naughty.config.presets.normal,
    title        = 'Hello Hackawax!',
    text         = text,
    icon         = beautiful.icon,
    bg           = beautiful.bg_normal,
    fg           = beautiful.fg_normal,
    font         = 'xos4 Terminus 12',
    border_width = dpi(4),
    border_color = "#ff0000",
--    border_color = beautiful.bg_urgent,
    margin       = dpi(40),
    -- shape        = gears.shape.rounded_rect,
    shape        = function(cr, w, h)
        return gears.shape.infobubble(cr, w, h, dpi(20), dpi(10), w/2 - dpi(10))
    end,
})
-- }}}

-- {{{ Variable definitions
local themes_path = gfs.get_configuration_dir() .. "themes"
beautiful.init(themes_path .. "/lightcircle/theme.lua")

local terminal1   = "urxvt -bg black -fg '#1793D1'"
local terminal    = "termite"
local editor      = os.getenv("EDITOR") or "vim"
local gui_editor  = "atom"
local browser     = "chromium"
local filemanager = "pcmanfm"
local editor_cmd  = terminal1 .. " -e " .. editor
local modkey      = "Mod4"
local altkey      = "Mod1"

-- awful.util.tagnames = { " 1 " , " 2 ", " 3 ", " 4 ", " 5 " }
awful.util.tagnames = { " Office ", " URxvt ", " Web ", " IDE ", " DEV " }

-- Table of layouts to cover with awful.layout.inc, order matters.
 awful.layout.layouts = {
     awful.layout.suit.floating,
     awful.layout.suit.tile,
     awful.layout.suit.tile.left,
     awful.layout.suit.tile.bottom,
     awful.layout.suit.tile.top,
     awful.layout.suit.fair,
     awful.layout.suit.fair.horizontal,
     -- awful.layout.suit.spiral,
     -- awful.layout.suit.spiral.dwindle,
     -- awful.layout.suit.max,
     -- awful.layout.suit.max.fullscreen,
     -- awful.layout.suit.magnifier,
     -- awful.layout.suit.corner.nw,
     -- awful.layout.suit.corner.ne,
     -- awful.layout.suit.corner.sw,
     -- awful.layout.suit.corner.se,
}

--[[ TODO >>>
awful.tag.add("Office", {
    icon = beautiful.awesome_icon,
    layout = awful.layout.suit.floating,
    master_fill_policy = "master_width_factor",
    gap_single_client = true,
    gap = dpi(15),
    screen = s,
    selected = true,
})

awful.tag.add("Term", {
    screen = s,
    icon = beautiful.arch_icon,
    layout = awful.layout.suit.floating,

})

awful.tag.add("IDE", {
    screen = s,
    icon = "",
    layout = awful.layout.suit.tile.left
})

awful.tag.add("DEV", {
    screen = s,
    icon = "",
    layout = awful.layout.suit.tile.left
})
--]]
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

awful.util.mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

--[[
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
--]]

-- Taglist buttons
awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Tasklist buttons
awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", { raise = true })
        end
    end),
    awful.button({ }, 2, function(c) c:kill() end),
    awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = dpi(350) } }) end),
    awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function() awful.client.focus.byidx(-1) end))

screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.on_screen_connect(s) end)

-- {{{ Mouse bindings
root.buttons(my_table.join(
    awful.button({ }, 3, function() awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(
    awful.key({ modkey,           }, "s", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
    awful.key({ modkey,           }, "Left", awful.tag.viewprev,
        { description = "view previous", group = "tag" }),
    awful.key({ modkey,           }, "Right", awful.tag.viewnext,
        { description = "view next", group = "tag" }),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
        { description = "go back", group = "tag" }),
    awful.key({ modkey,           }, "j", function() awful.client.focus.byidx(1) end,
        { description = "focus next by index", group = "client" }),
    awful.key({ modkey,           }, "k", function() awful.client.focus.byidx(-1) end,
        { description = "focus previous by index", group = "client" }),
    awful.key({ modkey,           }, "w", function() awful.util.mymainmenu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift"   }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey,           }, "Tab", function() awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end end,
        { description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey,           }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),
    -- awful.key({ modkey, "Control" }, "r", awesome.restart,
    awful.key({                   }, "F1", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),

    awful.key({ modkey,           }, "l",     function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey,           }, "h",     function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "h",     function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "l",     function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h",     function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l",     function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey,           }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift"   }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    awful.key({ modkey, "Control" }, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then c:emit_signal("request::activate", "key.unminimize", { raise = true }) end
    end,
        { description = "restore minimized", group = "client" }),

    -- Prompt
    awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = "launcher" }),

    awful.key({ modkey }, "x", function()
        awful.prompt.run {
            prompt       = "Lua > ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
        }
    end,
        { description = "lua execute prompt", group = "awesome" }),

    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
        { description = "show the menubar", group = "launcher" }),

    -- Toggle wibox visibility
    awful.key({ modkey }, "b", function()
        mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible
    end,
        { description = "toggle wibox", group = "awesome" }),

    -- Client menu as app switcher
    awful.key({ altkey }, "Escape", function()
        -- If you want to always position the menu on the same place set coordinates
        awful.menu.menu_keys.down = { "Down", "Alt_L" }
        awful.menu.clients({ theme = { width = dpi(350) }}, { keygrabber = true, coords = { x = 525, y = 330} })
    end,
        { description = "client menu application switcher", group = "launcher" }),

    -- Launch some apps
    awful.key({ modkey }, "e", function() awful.spawn(gui_editor) end,
        { description = "open editor", group = "launcher" }),
    awful.key({ modkey }, "c", function() awful.spawn(browser) end,
        { description = "open browser", group = "launcher" }),
    awful.key({ modkey }, "a", function() awful.spawn(filemanager) end,
        { description = "open filemanager", group = "launcher" }),

    -- Screenshot
    awful.key({ }, "Print", function() os.execute("screenshot") end,
        { description = "Take a screenshot", group = "awesome"})
)

clientkeys = my_table.join(
    awful.key({ modkey,           }, "f", function(c) c.fullscreen = not c.fullscreen; c:raise() end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift"   }, "c", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey,           }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey,           }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    awful.key({ modkey,           }, "n", function(c) c.minimized = true end,
        { description = "minimize", group = "client" }),
    awful.key({ modkey,           }, "m", function(c) c.maximized = not c.maximized; c:raise() end,
        { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m", function(c) c.maximized_vertical = not c.maximized_vertical; c:raise() end,
        { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift"   }, "m", function(c) c.maximized_horizontal = not c.maximized_horizontal; c:raise() end,
        { description = "(un)maximize horizontally", group = "client" }),

    -- Move and resize only floating clients
    -- Move client left/right/top/bottom
    awful.key({ altkey }, "Down", function(c) c:relative_move(0, 20, 0, 0) end,
        { description = "move client down", group = "client floaters resize and move" }),
    awful.key({ altkey }, "Up", function(c) c:relative_move(0, -20, 0, 0) end,
        { description = "move client up", group = "client floaters resize and move" }),
    awful.key({ altkey }, "Left", function(c) c:relative_move(-20, 0, 0, 0) end,
        { description = "move client left", group = "client floaters resize and move" }),
    awful.key({ altkey }, "Right", function(c) c:relative_move( 20, 0, 0, 0) end,
        { description = "move client right", group = "client floaters resize and move" }),
    -- Resize both client width/height
    awful.key({ altkey }, "Next", function(c) c:relative_move(20, 20, -40, -40) end,
        { description = "decrease client width and height size", group = "client floaters resize and move" }),
    awful.key({ altkey }, "Prior", function(c) c:relative_move(-20, -20, 40, 40) end,
        { description = "increase client width and height size", group = "client floaters resize and move" }),
    -- Resize client height
    awful.key({ altkey, "Shift" }, "Next", function(c) c:relative_move(0, 20, 0,-40) end,
        { description = "decrease client height size", group = "client floaters resize and move" }),
    awful.key({ altkey, "Shift" }, "Prior", function(c) c:relative_move(0, -20, 0, 40) end,
        { description = "increase client height size", group = "client floaters resize and move" }),
    -- Resize client width
    awful.key({ modkey, "Shift" }, "Next", function(c) c:relative_move(20, 0, -40, 0) end,
        { description = "increase client width size", group = "client floaters resize and move" }),
    awful.key({ modkey, "Shift" }, "Prior", function(c) c:relative_move(-20, 0, 40, 0) end,
        { description = "decrease client width size", group = "client floaters resize and move" }),
    -- Resize client side by side
    -- Resize left
    awful.key({ altkey, "Shift" }, "Right", function(c) c:relative_move(20, 0, -20, 0) end,
        { description = "decrease client left side", group = "client floaters resize and move" }),
    awful.key({ altkey, "Shift" }, "Left", function(c) c:relative_move(-20, 0, 20, 0) end,
        { description = "increase client left side", group = "client floaters resize and move" }),
    -- Resize right
    awful.key({ modkey, "Shift" }, "Left", function(c) c:relative_move(0, 0, -20, 0) end,
        { description = "decrease client right side", group = "client floaters resize and move" }),
    awful.key({ modkey, "Shift" }, "Right", function(c) c:relative_move(0, 0, 20, 0) end,
        { description = "increase client right side", group = "client floaters resize and move" }),
    -- Resize top
    awful.key({ altkey, "Shift" }, "Down", function(c) c:relative_move(0, 20, 0, -20) end,
        { description = "decrease client top side", group = "client floaters resize and move" }),
    awful.key({ altkey, "Shift" }, "Up", function(c) c:relative_move(0, -20, 0, 20) end,
        { description = "increase client top side", group = "client floaters resize and move" }),
    -- Resize bottom
    awful.key({ modkey, "Shift" }, "Up", function(c) c:relative_move(0, 0, 0, -20) end,
        { description = "decrease bottom left side", group = "client floaters resize and move" }),
    awful.key({ modkey, "Shift" }, "Down", function(c) c:relative_move(0, 0, 0, 20) end,
        { description = "increase client bottom side", group = "client floaters resize and move" }),

    -- Toggle titlebar
    awful.key({ modkey, "Shift" }, "t", awful.titlebar.toggle,
        { description = "toggle titlebar", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then tag:view_only() end
        end,
        { description = "view tag #"..i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then awful.tag.viewtoggle(tag) end
        end,
        { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
        end,
        { description = "move focused client to tag #"..i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:toggle_tag(tag) end
            end
        end,
        { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = my_table.join(
    awful.button({ }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            -- maximized_vertical = false,
            -- maximized_horizontal = false
        }
    },
    -- Add titlebars to normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true }
    },
    -- Gimp
    {
        rule = { class = "Gimp", role = "gimp-image-window" },
        properties = { floating = true }
    },
    -- Set Pcmanfm to always map on the tag named "1" on screen 1.
    {
        rule = { class = "Pcmanfm" },
        properties = { screen = 1, tag = awful.util.tagnames[1] }
    },
    -- Set Atom to always map on the tag named "4" on screen 1.
    {
        rule = { class = "Atom" },
        properties = { screen = 1, tag = awful.util.tagnames[4] }
    },
    -- Set Firefox to always map on the tag named "3" on screen 3.
    {
        rule = { class = "Firefox" },
        properties = { screen = 3, tag = awful.util.tagnames[3] }
    },
    -- Set Chromium to always map on the tag named "3" on screen 2.
    {
        rule = { class = "Chromium" },
        properties = { screen = 2, tag = awful.util.tagnames[3] }
    },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        -- awful.placement.no_offscreen(c)
        awful.placement.no_offscreen(c, { honor_workarea = true, margins = dpi(40) })
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    local titlebars = {
        _top    = awful.titlebar(c, { size = dpi(16), position = "top" }),
        _right  = awful.titlebar(c, { size = dpi(6), position = "right" }),
        _bottom = awful.titlebar(c, { size = dpi(6), position = "bottom" }),
        _left   = awful.titlebar(c, { size = dpi(6), position = "left" })
    }

    titlebars._top : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }

    titlebars._bottom : setup {
        nil,
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        nil,
        layout = wibox.layout.align.horizontal
    }

    titlebars._left : setup {
        nil,
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.flex.vertical
        },
        nil,
        layout = wibox.layout.align.vertical
    }

    titlebars._right : setup {
        nil,
        { -- Middle
            buttons = buttons,
            layout  = wibox.layout.flex.vertical
        },
        nil,
        layout = wibox.layout.align.vertical
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = true })
end)

client.connect_signal("focus", function(c)
    if c.maximized then
        c.border_width = dpi(0)
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end

    --[[
    -- test rounded corners
    if not c.fullscreen then
        c.shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, dpi(8))
            -- c.border_width = dpi(2)
        end
    end
    --]]
end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
