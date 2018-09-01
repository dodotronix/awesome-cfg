--------------------------------------------------------------------------------
-- AWESOME WINDOW-MANAGER: SHORTCUTS
--------------------------------------------------------------------------------
-- DODOTRONIX | Brno | 2018-07-21 Sat 12:19 PM 
--------------------------------------------------------------------------------
-- "THE BEERWARE LICENSE" (Revision 42):
-- Dodotronix wrote this code. As long as you retain this 
-- notice, you can do whatever you want with this stuff. If we
-- meet someday, and you think this stuff is worth it, you can
-- buy me a beer in return.
--------------------------------------------------------------------------------

local awful = require("awful")
local gears = require("gears")
local controls = require("controls")
local panel = require("panel")
local layouts = require("layouts")
local notes = require("notes")
local pager = require("pager")

local shortcuts = {}

function shortcuts:globalkeys()
  -- Default modkey
  modkey = "Mod1"

  return gears.table.join(
  awful.key({ modkey,}, "s", 
  controls.show_help(),
  {description="show help", group="awesome"}),
  awful.key({ modkey,}, "h",   
  awful.tag.viewprev,
  {description = "view previous", group = "tag"}),
  awful.key({ modkey,}, "n",
  awful.tag.viewnext,
  {description = "view next", group = "tag"}),
  awful.key({ modkey,}, "Escape", 
  awful.tag.history.restore,
  {description = "go back", group = "tag"}),
  awful.key({ modkey,}, "j", 
  controls.focus("Next"), 
  {description = "focus next by index", group = "client"}), 
  awful.key({ modkey,}, "k", 
  controls.focus("Previous"),
  {description = "focus previous by index", group = "client"}),

  -- Multimedia keys
  awful.key({ }, "XF86AudioRaiseVolume", 
  controls.volume("Raise")),
  awful.key({ }, "XF86AudioLowerVolume", 
  controls.volume("Lower")),
  awful.key({ }, "XF86AudioMute", 
  controls.volume("Mute")),

  -- Layout manipulation
  awful.key({ modkey, "Shift"	}, "j", 
  controls.swap("Next"),
  {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"	}, "k", 
  controls.swap("Previous"),
  {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey, "Control"	}, "j", 
  controls.focus_relative("Next"),
  {description = "focus the next screen", group = "screen"}),

  awful.key({ modkey, "Control"	}, "k", 
  controls.focus_relative("Previous"),
  {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey,		}, "u", 
  awful.client.urgent.jumpto,
  {description = "jump to urgent client", group = "client"}),
  awful.key({ modkey,		}, "Tab", 
  controls.go_back(),
  {description = "go back", group = "client"}),

  -- Standard program
  awful.key({ modkey,}, "Return", 
  controls.terminal,
  {description = "open a terminal", group = "launcher"}),
  awful.key({ modkey, "Control"}, "r", 
  awesome.restart,
  {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"}, "q", 
  awesome.quit,
  {description = "quit awesome", group = "awesome"}),

  awful.key({ modkey,}, "l", 
  controls.master_width("Increase"),
  {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey,}, "h", 
  controls.master_width("Decrease"),
  {description = "decrease master width factor", group = "layout"}),
  awful.key({ modkey, "Shift"}, "h", 
  controls.client_num("Increase"),
  {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"}, "l", 
  controls.client_num("Decrease"),
  {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control"}, "h", 
  controls.column_num("Increase"),
  {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control"}, "l", 
  controls.column_num("Decrease"),
  {description = "decrease the number of columns", group = "layout"}),

  awful.key({ modkey,}, "space", 
  controls.layout_sel("Next"),
  {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", 
  controls.layout_sel("Previous"),
  {description = "select previous", group = "layout"}),
  awful.key({ modkey, "Control" }, "n", 
  controls.restore_minimized(),
  {description = "restore minimized", group = "client"}))
end

function test(c) c:kill() end

function shortcuts:clientkeys()
  return gears.table.join(
  awful.key({ modkey,}, "f", 
  controls.fullscreen,
  {description = "toggle fullscreen", group = "client"}),
  awful.key({ modkey, "Shift"}, "c", 
  controls.kill,
  {description = "close", group = "client"}),
  awful.key({ modkey, "Control"}, "space",  
  awful.client.floating.toggle,
  {description = "toggle floating", group = "client"}),
  awful.key({ modkey, "Control"}, "Return", 
  controls.to_master,
  {description = "move to master", group = "client"}),
  awful.key({ modkey,}, "o", 
  controls.to_screen,
  {description = "move to screen", group = "client"}),
  awful.key({ modkey,}, "t", 
  controls.ontop,
  {description = "toggle keep on top", group = "client"}),
  awful.key({ modkey,}, "b", 
  controls.minimize,
  {description = "minimize", group = "client"}),
  awful.key({ modkey,}, "m", 
  controls.maximize,
  {description = "(un)maximize", group = "client"}),
  awful.key({ modkey, "Control"}, "m", 
  controls.maximize_v,
  {description = "(un)maximize vertically", group = "client"}),
  awful.key({ modkey, "Shift"}, "m", 
  controls.maximize_h,
  {description = "(un)maximize horizontally", group = "client"}))
end

function shortcuts:clientbuttons()
  return gears.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))
end

function shortcuts:enable()
  globalkeys = shortcuts.globalkeys()
  root.keys(globalkeys)
end

return shortcuts
