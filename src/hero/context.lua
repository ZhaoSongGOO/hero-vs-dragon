local PlayerDirection = {
    Left = 0,
    Right = 1,
    Top = 2,
    Bottom = 3
}

local Context = {}

Context.__index = Context

function Context.new(x, y, s)
    local instance = setmetatable({}, Context)
    instance.isMoving = false
    instance.direction = PlayerDirection.Bottom
    instance.isAttack = false
    instance.isRunning = false
    instance.x = x
    instance.y = y
    instance.speed = s
    return instance
end

function Context:update(dt)
    if love.keyboard.isDown('w') then
        self.direction = PlayerDirection.Top
        self.isMoving = true
    elseif love.keyboard.isDown('a') then
        self.direction = PlayerDirection.Left
        self.isMoving = true
    elseif love.keyboard.isDown('s') then
        self.direction = PlayerDirection.Bottom
        self.isMoving = true
    elseif love.keyboard.isDown('d') then
        self.direction = PlayerDirection.Right
        self.isMoving = true
    else
        self.isMoving = false
    end
        
    if self.isMoving then
        if love.keyboard.isDown('lshift') then
            self.isRunning = true
        else
            self.isRunning = false
        end
    end

    if love.keyboard.isDown('j') then
        self.isAttack = true
        self.isMoving = false
    else
        self.isAttack = false
    end

    if self.isMoving then
        speed = self.speed
        if self.isRunning then
            speed = speed * 2
        end
        if self.direction == PlayerDirection.Left then
            self.x = self.x - speed * dt
        elseif self.direction == PlayerDirection.Right then
            self.x = self.x + speed * dt
        elseif self.direction == PlayerDirection.Top then
            self.y = self.y - speed * dt
        elseif self.direction == PlayerDirection.Bottom then
            self.y = self.y + speed * dt
        end 
    end
end

return Context

