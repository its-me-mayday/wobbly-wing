local Bird = require("bird")
local Pipe = require("pipe")

local bird
local pipes = {}
local pipeTimer = 0
local pipeInterval = 2

function love.load()
    bird = Bird:new(100, 200, {1, 0, 0})
end

function love.update(dt)
    if bird then
        bird:update(dt)
    end

    pipeTimer = pipeTimer + dt
    if pipeTimer >= pipeInterval then
        pipeTimer = 0
        local gapY = math.random(100, love.graphics.getHeight() - 200)
        table.insert(pipes, Pipe:new(love.graphics.getWidth(), gapY, 150))
    end

    for i = #pipes, 1, -1 do
        pipes[i]:update(dt)
        if pipes[i].x + pipes[i].width < 0 then
            table.remove(pipes, i)
        end
    end
end

function love.draw()
    if bird then
        bird:draw()
    end
    for _, pipe in ipairs(pipes) do
        pipe:draw()
    end
end

function love.keypressed(key)
    if key == "space" then
        bird:jump()
    end
end