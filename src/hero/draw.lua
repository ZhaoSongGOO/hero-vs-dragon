local Animation = require('src/hero/animation')
local Drawer = {}

Drawer.__index = Drawer

function Drawer.new(ctx)
    local instance = setmetatable({}, Drawer)
    instance.walkSpriteSheet = love.graphics.newImage('asset/walk_side.png')
    -- local frameWidth = 384 / 6 -- 64 pixels
    -- local frameHeight = 64
    -- instance.totalFrames = 6

    -- -- 4. Create Quads for animation
    -- instance.quads = {}
    -- for i = 1, instance.totalFrames do
    --     local quadX = (i - 1) * frameWidth
    --     local quadY = 0
    --     instance.quads[i] = love.graphics.newQuad(quadX, quadY, frameWidth, frameHeight, instance.walkSpriteSheet:getDimensions())
    -- end

    -- -- 5. Initialize animation and state variables
    -- instance.currentFrame = 1
    -- instance.frameDuration = 0.1
    -- instance.timer = 0
    instance.ctx = ctx
    instance.animations = {
        walkSide = Animation.new(ctx, 'asset/walk_side.png', {
            width = 384,
            height = 64,
            count = 6
        })
    }
    return instance
end

function Drawer:update(dt)
    self.animations.walkSide:update(dt)
end

function Drawer:draw()
    self.animations.walkSide:draw()
end

return Drawer

