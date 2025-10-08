local Animation = {}

Animation.__index = Animation

function Animation.new(ctx, src, config)
    local instance = setmetatable({}, Animation)
    instance.sheet = love.graphics.newImage(src)
    local frameWidth = config.width / config.count -- 64 pixels
    local frameHeight = config.height
    instance.totalFrames = config.count

    -- 4. Create Quads for animation
    instance.quads = {}
    for i = 1, instance.totalFrames do
        local quadX = (i - 1) * frameWidth
        local quadY = 0
        instance.quads[i] = love.graphics.newQuad(quadX, quadY, frameWidth, frameHeight, instance.sheet:getDimensions())
    end

    -- 5. Initialize animation and state variables
    instance.currentFrame = 1
    instance.frameDuration = 0.1
    instance.timer = 0
    instance.ctx = ctx
    return instance
end

function Animation:update(dt)
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

function Animation:draw()
    local currentQuad = self.quads[self.currentFrame]

    scaleX = 5
    if self.ctx.direction == 0 then
        scaleX = -5
    end
    love.graphics.draw(self.sheet, currentQuad, self.ctx.x, self.ctx.y, 0, scaleX, 5, 384 / 12, 0)
end


return Animation

