-- notes config and methods
--

local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")
local panel = require("panel")
local pager = require("pager")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local controls = {}

function controls.show_help()
  return hotkeys_popup.show_help
end

function controls.volume(stat)
  if stat == "Raise" then
    return function()
     awful.spawn("amixer -q -D pulse sset Master 3%+")
    end
  elseif stat == "Lower" then
    return function()
      awful.spawn("amixer -q -D pulse sset Master 3%-")
    end
  elseif stat == "Mute" then
    return function()
      awful.spawn("amixer -q -D pulse sset Master toggle")
    end
  end
end

function controls.master_width(stat)
  if stat == "Increase" then
    return function()
      awful.tag.incmwfact( 0.05)
    end
  elseif stat == "Decrease" then
    return function()
      awful.tag.incmwfact(-0.05)
    end
  end
end

function controls.client_num(stat)
  if stat == "Increase" then
    return function()
      awful.tag.incnmaster(1, nil, true)
    end
  elseif stat == "Decrease" then
    return function()
     awful.tag.incnmaster(-1, nil, true)
   end
  end
end

function controls.column_num(stat)
  if stat == "Increase" then
    return function()
      awful.tag.incnmaster(1, nil, true)
    end
  elseif stat == "Decrease" then
    return function()
      awful.tag.incnmaster(-1, nil, true)
    end
  end
end

function controls.focus(stat)
  if stat == "Next" then
    return function()
      awful.client.focus.byidx(1)
    end
  elseif stat == "Previous" then
    return function()
      awful.client.focus.byidx(-1)
      end
  end
end

function controls.swap(stat)
  if stat == "Next" then
    return function()
      awful.client.swap.byidx(1) 
    end
  elseif stat == "Previous" then
    return function()
      awful.client.swap.byidx(-1)
    end
  end
end

function controls.focus_relative(stat)
  if stat == "Next" then
    return function()
      awful.screen.focus_relative(1)
    end
  elseif stat == "Previous" then
    return function()
      awful.screen.focus_relative(-1)
    end
  end
end

function controls.layout_sel(stat) 
  if stat == "Next" then
    return function()
      awful.layout.inc(1) 
    end
  elseif stat == "Previous" then
    return function()
      awful.layout.inc(-1) 
    end
  end
end

function controls.go_back()
  awful.client.focus.history.previous() 
  if client.focus then 
    client.focus:raise() 
  end 
end

function controls.terminal()
  terminal = "xterm"
  awful.spawn(terminal)
end

function controls.fullscreen(c)
  c.fullscreen = not c.fullscreen
  c:raise()
end

function controls.kill(c)
  c:kill()
end

function controls.to_master(c)
  c:swap(awful.client.getmaster()) 
end

function controls.to_screen(c)
  c:move_to_screen()
end

function controls.ontop(c)
  c.ontop = not c.ontop 
end

function controls.minimize(c)
  c.minimized = true
end

function controls.maximize(c)
  c.maximized = not c.maximized
  c:raise()
end

function controls.maximize_h(c)
  c.maximized_horizontal = not c.maximized_horizontal
  c:raise()
end

function controls.maximize_v(c)
  c.maximized_vertical = not c.maximized_vertical
  c:raise()
end

function controls.restore_minimized()
  local c = awful.client.restore() 
  if c then 
    client.focus = c c:raise() 
  end
end

function controls.show_menu()
mouse.coords{ x =math.floor(geo.width/3),  
	      y =math.floor(eo.height/4)} 
menu:show() 
end

function controls.enable()
--naughty.notify({title=tostring(globalkeys)})
--client.connect_signal("property::fullscreen", function (c) end)
--client.connect_signal("manage", function (c) end)
--client.connect_signal("request::titlebars", function(c) end)
--client.connect_signal("mouse::enter", function(c) end)
--client.connect_signal("focus", function(c) end) 
--client.connect_signal("unfocus", function(c) end)

end

return controls
