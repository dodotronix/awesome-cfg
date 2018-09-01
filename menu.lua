--------------------------------------------------------------------------------
-- AWESOME WINDOW-MANAGER: MENU CONFIG AND SETUP
--------------------------------------------------------------------------------
-- DODOTRONIX | Brno | 2018-07-21 Sat 12:19 PM 
--------------------------------------------------------------------------------
-- "THE BEERWARE LICENSE" (Revision 42):
-- Dodotronix wrote this code. As long as you retain this 
-- notice, you can do whatever you want with this stuff. If we
-- meet someday, and you think this stuff is worth it, you can
-- buy me a beer in return.
--------------------------------------------------------------------------------

-- automatic menu assembly
local freedesktop = require("freedesktop")
local menubar = require("menubar")

local menu = {}

function menu:Init()

myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}

--TODO rewrite freedesktop with your own categories 
--set the biggest icons 
--set size on screen 
mymainmenu = freedesktop.menu.build({
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon }
    }, icon_size = 128
  })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
end


return menu
