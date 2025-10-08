local Animation = require('src/hero/animation')
local PlayerDirection = require("src/hero/constants")
local Drawer = {}

Drawer.__index = Drawer

function Drawer.new(ctx)
    local instance = setmetatable({}, Drawer)
    instance.ctx = ctx
    instance.animations = {
        walkLeft = Animation.new(ctx, 'asset/walk_side.png', {
            width = 384,
            height = 64,
            count = 6,
            scale = -1,
        }),
        walkRight = Animation.new(ctx, 'asset/walk_side.png', {
            width = 384,
            height = 64,
            count = 6,
        }),
        walkUp = Animation.new(ctx, 'asset/walk_up.png', {
            width = 384,
            height = 64,
            count = 6
        }),
        walkDown = Animation.new(ctx, 'asset/walk_down.png', {
            width = 384,
            height = 64,
            count = 6
        }),
        attackLeft = Animation.new(ctx, 'asset/attack_side.png', {
            width = 512,
            height = 64,
            count = 8,
            scale = -1,
        }),
        attackRight = Animation.new(ctx, 'asset/attack_side.png', {
            width = 512,
            height = 64,
            count = 8
        }),
        attackDown = Animation.new(ctx, 'asset/attack_down.png', {
            width = 512,
            height = 64,
            count = 8
        }),
        attackUp = Animation.new(ctx, 'asset/attack_up.png', {
            width = 512,
            height = 64,
            count = 8
        }),
    }
    return instance
end

function Drawer:update(dt)
    if self.ctx.isMoving then
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.walkLeft:update(dt)
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.walkRight:update(dt)
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.walkUp:update(dt)
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.walkDown:update(dt)
        end
    elseif self.ctx.isAttack then
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.attackLeft:update(dt)
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.attackRight:update(dt)
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.attackUp:update(dt)
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.attackDown:update(dt)
        end
    else
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.walkLeft:reset()
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.walkRight:reset()
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.walkUp:reset()
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.walkDown:reset()
        end
    end
end

function Drawer:draw()
    if self.ctx.isMoving then
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.walkLeft:draw()
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.walkRight:draw()
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.walkUp:draw()
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.walkDown:draw(dt)
        end
    elseif self.ctx.isAttack then
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.attackLeft:draw()
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.attackRight:draw()
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.attackUp:draw()
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.attackDown:draw(dt)
        end
    else
        if self.ctx.direction == PlayerDirection.Left then
            self.animations.walkLeft:draw()
        elseif self.ctx.direction == PlayerDirection.Right then
            self.animations.walkRight:draw()
        elseif self.ctx.direction == PlayerDirection.Top then
            self.animations.walkUp:draw()
        elseif self.ctx.direction == PlayerDirection.Bottom then
            self.animations.walkDown:draw(dt)
        end
    end
end

return Drawer

