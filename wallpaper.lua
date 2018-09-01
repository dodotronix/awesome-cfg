-- panel config and methods
--

local awful = require("awful")
local gears = require("gears")
local wallpaper = {}

function wallpaper:Init(s)
  -- Wallpaper
  w = "/home/idlerug/download/awesome-cfg/girl_wallpaper.jpg"
  gears.wallpaper.maximized(w, s, true)
end

function wallpaper:enable()
  awful.screen.connect_for_each_screen(wallpaper.Init)
end

function wallpaper:reset()
  -- Re-set wallpaper when a screen's geometry changes 
  -- (e.g. different resolution)
  screen.connect_signal("property::geometry", set_wallpaper)
end

return wallpaper
