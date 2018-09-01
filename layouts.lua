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
local awful = require("awful")

local layout = {}

function layout:init()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  return {
    awful.layout.suit.floating,
    awful.layout.suit.fair
  }
end

function layout:enable()
  awful.layout.layouts = layout.init()
end

return layout
