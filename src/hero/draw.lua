local Drawer = {}

Drawer.__index = Drawer

function Drawer.new(ctx)
    local instance = setmetatable({}, Drawer)
    instance.walkSpriteSheet = love.graphics.newImage('asset/walk_side.png')
    local frameWidth = 384 / 6 -- 64 pixels
    local frameHeight = 64
    instance.totalFrames = 6

    -- 4. Create Quads for animation
    instance.quads = {}
    for i = 1, instance.totalFrames do
        local quadX = (i - 1) * frameWidth
        local quadY = 0
        instance.quads[i] = love.graphics.newQuad(quadX, quadY, frameWidth, frameHeight, instance.walkSpriteSheet:getDimensions())
    end

    -- 5. Initialize animation and state variables
    instance.currentFrame = 1
    instance.frameDuration = 0.1
    instance.timer = 0
    instance.ctx = ctx
    return instance
end

function Drawer:update(dt)
    if self.ctx.isMoving then
        self.timer = self.timer + dt
        if self.timer >= self.frameDuration then
            self.timer = self.timer - self.frameDuration
            self.currentFrame = self.currentFrame + 1
            if self.currentFrame > self.totalFrames then
                self.currentFrame = 1
            end
        end
    else
        self.currentFrame = 1
        self.timer = 0
    end
end

function Drawer:draw()
    -- 1. Get the current Quad
    local currentQuad = self.quads[self.currentFrame]

    -- 2. Draw the hero on the screen
    love.graphics.draw(self.walkSpriteSheet, currentQuad, self.ctx.x, self.ctx.y, 0, 5, 5)
end

return Drawer

