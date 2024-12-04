local Bird = {}

function Bird:new(x, y, color)
    local bird = {
        x = x,
        y = y,
        width = 20,
        height = 20,
        dy = 0,
        gravity = 800,
        jumpForce = -300,
        color = color or {1,1,1}
    }
    setmetatable(bird, self)
    self.__index = self
    return bird
end

function Bird:update(dt)
    self.dy = self.dy + self.gravity * dt
    self.y = self.y + self.dy * dt

    if self.y + self.height < 0 then
        print("in loop", self.y, self.height)
        self.y = self.height - 30
        self.dy = 20
    end
 
    if self.y + self.height > love.graphics.getHeight() then
        print("in loop", self.y, self.height)
        self.y = love.graphics.getHeight() - self.height
        self.dy = 0
    end
end

function Bird:jump()
    self.dy = self.jumpForce
end

function Bird:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Bird