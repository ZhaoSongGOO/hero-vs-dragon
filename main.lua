-- main.lua

-- First, we "import" our hero module. The 'require' function loads the hero.lua
-- file and returns the table that it returned (the 'Hero' table).
-- We store it in a variable, also named 'Hero' by convention.
local Hero = require('src/hero/hero')

-- A global variable to hold our player object
local player

function love.load()
    -- 1. Set global settings that affect the whole game
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- 2. Create our player!
    -- We call the Hero.new() function from our module to create a new
    -- hero instance and we store it in the 'player' variable.
    -- We can give it a starting position, like (100, 300).
    player = Hero.new(100, 300)
end

function love.update(dt)
    -- Now, the update function is super clean.
    -- We just tell our player object to update itself.
    -- The player object itself knows how to handle input and animation.
    player:update(dt)
end

function love.draw()
    -- The draw function is also very clean.
    -- We just tell our player object to draw itself.
    player:draw()
end
