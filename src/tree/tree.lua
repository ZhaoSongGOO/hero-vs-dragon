local Animation = require('src/common/animation')
local Context = require('src/tree/context')
local Tree = {}

Tree.__index = Tree

function Tree.new(x, y, config)
    local instance = setmetatable({}, Tree)
    instance.ctx = Context.new(x, y, 200)
    instance.animations = {
        springTree = Animation.new(instance.ctx, 'asset/tree.png', {
            width = 160,
            height = 128,
            count = 2,
        }),
    }
    return instance
end

function Tree:update(dt)
    self.ctx:update(dt)
    self.animations.springTree:setFrame(1)
end


function Tree:draw()
    self.animations.springTree:draw(dt)
end


return Tree
