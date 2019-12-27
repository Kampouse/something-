require "socket"
require "class(player)"
local sprite
local x 
local y 
local virtualWidth = 432
local virtualHeight = 432
local speeed = 10


local player = {}
player["age"] = 5








function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')

    sprite = love.graphics.newImage('graphics/test.png')
    x = virtualWidth / 2 - sprite: getWidth() / 2
    y = virtualHeight / 2 - sprite: getHeight() / 2

    
end


function love.keypressed(key)
    if key == "i" then
        print(player.age)
        end
    if key == 'escape' then 
    love.event.quit()    
        end
end

function love.update(dt)
    
    y = y + 1
    if love.keyboard.isDown('up') then
        y = y - 3
        print(x)
        end
    if  love.keyboard.isDown('down')then
        print(y) 
        y= y + 1
        end
    if  love.keyboard.isDown('right')then
        x = x - 1
        end
    if  love.keyboard.isDown('left')then
        x = x + 1
        print(x)
        end
    if x >= -24 then
        x = x - 1
        end
    if y > 82 then
        y = y - 1
        end 
    if  y > 83 then
        y  = y - 1
        end
    if x < -100 then
    x = x + 5
        end    
    end    
   
function love.draw()
    love.graphics.draw(sprite,x,y)
end
