local Animation = {}

Animation.__index = Animation

function Animation.new(ctx, src, config)
    local instance = setmetatable({}, Animation)
    instance.sheet = love.graphics.newImage(src)
    local frameWidth = config.width / config.count -- 64 pixels
    local frameHeight = config.height
    instance.totalFrames = config.count
    instance.frameWidth = frameWidth
    instance.frameHeight = frameHeight

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
    instance.scaleDirection = config.scale ~= nil and config.scale or 1
    instance.originX = frameWidth / 2 -- x轴原点偏移
    instance.originY = 0           -- y轴原点偏移
    return instance
end

function Animation:reset()
    self.currentFrame = 1
    self.timer = 0
end

function Animation:setFrame(frame)
    if frame < 1 or frame > self.totalFrames then
        return
    end
        
    self.currentFrame = frame
    self.timer = 0
end

function Animation:update(dt)
    -- if self.ctx.isMoving then
    self.timer = self.timer + dt
    if self.timer >= self.frameDuration then
        self.timer = self.timer - self.frameDuration
        self.currentFrame = self.currentFrame + 1
        if self.currentFrame > self.totalFrames then
            self.currentFrame = 1
        end
    end
    -- else
    --     self.currentFrame = 1
    --     self.timer = 0
    -- end
end

function Animation:draw()
    local currentQuad = self.quads[self.currentFrame]
    love.graphics.draw(self.sheet, currentQuad, self.ctx.x, self.ctx.y, 0, self.scaleDirection * 3, 3, self.originX, self.originY)
    local scaleX = self.scaleDirection * 3
    local scaleY = 3
    -- 绘制矩形框（修正位置，考虑原点偏移和缩放）
    love.graphics.setColor(1, 0, 0)
    -- 计算矩形框的实际左上角位置（补偿原点偏移）
    local rectX = self.ctx.x - self.originX * scaleX
    local rectY = self.ctx.y - self.originY * scaleY
    -- 绘制矩形框，确保与图片对齐
    love.graphics.rectangle("line", rectX, rectY, self.frameWidth * scaleX, self.frameHeight * scaleY)
    love.graphics.setColor(1, 1, 1)
end


return Animation

