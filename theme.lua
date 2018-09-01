--------------------------------------------------------------------------------
-- AWESOME WINDOW-MANAGER: LAYOUT CONFIG AND SETUP
--------------------------------------------------------------------------------
-- DODOTRONIX | Brno | 2018-07-21 Sat 12:19 PM 
--------------------------------------------------------------------------------
-- "THE BEERWARE LICENSE" (Revision 42):
-- Dodotronix wrote this code. As long as you retain this 
-- notice, you can do whatever you want with this stuff. If we
-- meet someday, and you think this stuff is worth it, you can
-- buy me a beer in return.
--------------------------------------------------------------------------------

local gears = require("gears")
local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local fsize = 18

local theme = {}

-- gradient colors
local bg_grad = {
    type="linear", 
    from = {0, 0}, 
    to = {0, 45}, 
    stops = { 
        {0, "#45484d"}, 
        {0.5, "#000000"}, 
        {1, "#45484d"} 
    } 
}

--taglist gradient
local bg_grad_taglist_bg = {
    type="linear", 
    from = {0, 0}, 
    to = {0, 85}, 
    stops = {
        {0.1, "#45484d"}, 
        {0.5, "#000000"}, 
        {1, "#45484d"} 
    } 
}

--menu gradient color
local bg_grad_menu_bg = {
    type="linear", 
    from = {0, 0}, 
    to = {0, 85}, 
    stops = {
        {0, "#ff9e01"},
        {0.01, "#45484d"}, 
        {0.5, "#000000"}, 
        {0.99, "#45484d"},
        {1, "#ff9e01"}
    }
}

theme.font          = "System San Francisco" .. fsize
theme.bg_normal     = bg_grad
theme.bg_focus      = "#324851"
theme.bg_urgent     = "#f52549"
theme.bg_minimize   = "#34675c"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = 0
theme.border_width  = dpi(3)
theme.border_normal = "#000000"
theme.border_focus  = "#3173d4"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(8)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- client color setup
theme.titlebar_bg_normal = bg_grad
theme.titlebar_bg_focus = bg_grad

local rec_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 0)
end

--theme.taglist_shape = gears.shape.rounded_rect
theme.taglist_font = "System San Francisco 70"
theme.taglist_fg_focus = "#ffb01b"
theme.taglist_bg_focus = bg_grad_taglist_bg
theme.taglist_bg_occupied = bg_grad_taglist_bg
theme.taglist_bg_empty = bg_grad_taglist_bg
--theme.taglist_bg_urgent =

--define shape of element
theme.taglist_shape = rec_shape
theme.taglist_shape_border_width = 4
theme.taglist_shape_border_color = "#ff9e01"
theme.taglist_spacing = -2

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

theme.tasklist_font = "System San Francisco 18"
theme.tasklist_shape = rec_shape
theme.tasklist_shape_border_width = 1
theme.tasklist_shape_border_color = "#ff9e01"
theme.tasklist_bg_focus = bg_grad

theme.bg_systray = "#45484d"

theme.menu_submenu = ""
theme.menu_border_width = 1
theme.menu_border_color = "#ff9e01"
theme.menu_fg_focus = "#ff9e01"
theme.menu_bg_normal = bg_grad_menu_bg

theme.menu_height = fsize*3
theme.menu_width  = fsize*15

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/idlerug/download/awesome-cfg/girl_wallpaper.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme ="Adwaita"  --"/home/idlerug/.icons/"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
