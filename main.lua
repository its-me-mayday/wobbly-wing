function love.load()
    bird = {
        x = 100,
        y = 200,
        width = 20,
        height = 20,
        dy = 0,
        gravity = 700,
        jump = -300
    }
end

function love.update(dt)
    bird.dy = bird.dy + bird.gravity * dt
    bird.y = bird.y + bird.dy * dt
    
    if bird.y + bird.height < 0 then
        print("in loop", bird.y ,bird.height)
        bird.y = bird.height - 30
        bird.dy = 20
    end
    
    if bird.y + bird.height > love.graphics.getHeight() then
        print("in loop", bird.y ,bird.height)
        bird.y = love.graphics.getHeight() - bird.height
        bird.dy = 0
    end
end

function love.draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", bird.x, bird.y, bird.width, bird.height)
end

function love.keypressed(key)
    if key == "space" then
        bird.dy = bird.jump
    end
end