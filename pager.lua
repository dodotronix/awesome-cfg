-- tag config and methods
--

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local pager = {} 
local p

function pager:init(s)
  p = wibox({
      height=200,
      width=200,
      ontop=true,
      screen=s
    })
   
  awful.tag({" 1 "}, s, awful.layout.layouts[1])
   
  --naughty.notify({title=tostring(screen[1].geometry.width)})
  --p:geometry({x=800, y = 500})
  --p:struts{left = 0, right = 0, bottom = 0, top = 0}
end

function pager:enable()
  awful.screen.connect_for_each_screen(pager.init)
end

function pager:add()

end

function pager:erase()

end

function pager:visible()

end

function pager:focus(c)
  if c.fullscreen then
    p.visible = false
  else
    p.visible = true
  end

  --p:struts{left = 0, right = 0, bottom = 0, top = 20}
end

function pager:unfocus()
  --p:geometry({x =math.floor((geo.width - panels[2].width)/2), 
  --y =math.floor(geo.height/6 - panels[2].height/2)})
  --p:struts{left = 0, right = 0, bottom = 0, top = 0}
end


return pager
