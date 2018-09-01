--------------------------------------------------------------------------------
-- AWESOME WINDOW-MANAGER: MAIN CONFIG
--------------------------------------------------------------------------------
-- DODOTRONIX | Brno | 2018-07-21 Sat 12:19 PM 
--------------------------------------------------------------------------------
-- "THE BEERWARE LICENSE" (Revision 42):
-- Dodotronix wrote this code. As long as you retain this 
-- notice, you can do whatever you want with this stuff. If we
-- meet someday, and you think this stuff is worth it, you can
-- buy me a beer in return.
--------------------------------------------------------------------------------

local panel = require("panel")
local pager = require("pager")
local wallpaper = require("wallpaper")
local checkerror = require("checkerror")
local beautiful = require("beautiful")
local theme = require("theme")
local layouts = require("layouts")
local shortcuts = require("shortcuts")
local rules = require("rules")
local controls = require("controls")

-- check for Startup errors
checkerror.startup()
-- turn on runtime error checking
checkerror.runtime()

-- color scheme init
beautiful.init(theme)

-- setup wallpaper on every screen
wallpaper.enable()

-- enables main panel with task list and clock
--panel.enable()

-- adds dynamic pager 
pager.enable()

-- shortcuts initialization
shortcuts.enable()

-- activate layouts
layouts.enable()

-- activate rules
rules.enable()
