local Context = {}

Context.__index = Context

function Context.new(x, y)
    local instance = setmetatable({}, Context)
    instance.x = x
    instance.y = y
    return instance
end

function Context:update(dt)
end

return Context

