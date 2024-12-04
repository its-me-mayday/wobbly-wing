local Bird = require("bird")

local bird

function love.load()
    bird = Bird:new(100, 200, {1, 0, 0})
end

function love.update(dt)
    bird:update(dt)
end

function love.draw()
    bird:draw()
end

function love.keypressed(key)
    if key == "space" then
        bird:jump()
    end
end