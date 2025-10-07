local Context = require('src/hero/context')
local Drawer = require('src/hero/draw')

local Hero = {}

Hero.__index = Hero

function Hero.new(x, y)
    local instance = setmetatable({}, Hero)
    instance.ctx = Context.new(x, y, 200)
    instance.drawer = Drawer.new(instance.ctx)
    return instance
end

-- This is the hero's own update function.
-- The 'self' parameter automatically refers to the specific hero instance
-- that is calling this function (e.g., the 'player' object in main.lua).
function Hero:update(dt)
    self.ctx:update(dt)
    self.drawer:update(dt)
end

-- This is the hero's own draw function.
-- 'self' again refers to the specific hero instance.
function Hero:draw()
    self.drawer:draw()
end

-- This is crucial! It makes the 'Hero' table available to other files
-- that use require('hero').
return Hero
