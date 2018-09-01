--------------------------------------------------------------------------------
-- AWESOME WINDOW-MANAGER: PANEL CONFIG AND SETUP
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
local beautiful = require("beautiful")
local theme = require("theme")
local gears = require("gears")
local shortcuts = require("shortcuts")

local rules = {}

function rules:enable()
  -- {{{ Rules
  -- Rules to apply to new clients (through the "manage" signal).
  awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
    properties = { border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = awful.client.focus.filter,
    raise = true,
    size_hints_honor = false,
    keys = shortcuts.clientkeys(),
    buttons = shortcuts.clientbuttons(),
    screen = awful.screen.preferred,
    --placement = awful.placement.no_overlap+awful.placement.no_offscreen
    placement = awful.placement.centered
  }
      },
      -- Floating clients.
      { rule_any = {
	instance = {
	  "DTA",  -- Firefox addon DownThemAll.
	  "copyq",  -- Includes session name in class.
	},
	class = {
	  "Arandr",
	  "Gpick",
	  "Kruler",
	  "MessageWin",  -- kalarm.
	  "Sxiv",
	  "Wpa_gui",
	  "pinentry",
	  "veromix",
	  "xtightvncviewer"},

	  name = {
	    "Event Tester",  -- xev.
	  },
	  role = {
	    "AlarmWindow",  -- Thunderbird's calendar.
	    "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
	  }
	}, properties = { floating = true }},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    }, 
    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
  }
  -- }}}

  -- Signal function to execute when a new client appears.
  client.connect_signal("manage", function (c)
      -- Set the windows at the slave,
      -- i.e. put it at the end of others instead of setting it master.
      -- if not awesome.startup then awful.client.setslave(c) end

      if awesome.startup and
	not c.size_hints.user_position
	and not c.size_hints.program_position then
	  -- Prevent clients from being unreachable after screen count changes.
	  awful.placement.no_offscreen(c)
      end
  end)
end

return rules
