-- panel config and methods
--

local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

local panel = {}
local p

function panel:init(s)
  --local display = screen[1].outputs.default
  local p = awful.wibar({
      height=40,
      width=100,
      ontop=true,
      position="top",
      screen=s
  })
  --naughty.notify({title=tostring(screen[1].outputs.default.mm_height)})
  --for key, value in pairs(screen[1].outputs) do
    --naughty.notify({title=tostring(key)})
  --end
  p:geometry({x=100, y=100})
  p:struts{left = 0, right = 0, bottom = 0, top = 40} 
end

function panel:fullscreen(c)
  if c.fullscreen then
    p.visible = false
  else
    p.visible = true
  end
end

function panel:focus(c)
  panel.fullscreen(c)
  p:struts{left = 0, right = 0, bottom = 0, top = 20}
end

function panel:unfocus()
  p.visible = true
  p:struts{left = 0, right = 0, bottom = 0, top = 20}
end

function panel.enable()
  awful.screen.connect_for_each_screen(panel.init)
  client.connect_signal("property::fullscreen", panel.fullscreen)
end

return panel
