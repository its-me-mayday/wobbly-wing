local Pipe = {}

function Pipe:new(x, gapY, gapHeight)
    local pipe = {
        x = x,
        width = 50,
        gapY = gapY,
        gapHeight = gapHeight,
        speed = 200
    }
    setmetatable(pipe, self)
    self.__index = self
    return pipe
end

function Pipe:update(dt)
    self.x = self.x - self.speed * dt
end

function Pipe:draw()
    love.graphics.setColor(0.5, 0.8, 0.9)
    love.graphics.rectangle("fill", self.x, 0, self.width, self.gapY)
    love.graphics.rectangle("fill", self.x, self.gapY + self.gapHeight, self.width, love.graphics.getHeight())
end

return Pipe