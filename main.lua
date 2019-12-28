require "socket"

local sprite
local x 
local y 
local virtualWidth = 432
local virtualHeight = 432
local speeed = 10


local player = {}
  player["left"] = function(x,y)
    love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo1.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2
    player.state = "left"
    end
  player["right"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2
    player.state = "right"
    end


  player["down"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogosleep.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2 - 10  
    player.state = "down"

end



-- dont touche this
function love.load() 
love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  


end

-- dont touche this

function love.keypressed(key)
    if key == "up" then
        y  = y - 250
        end
    if key == 'escape' then 
    love.event.quit()    
        end
     if key == "right" then
        player.left(x,y)
        print(player.state)
        end
     if key == "left" then 
        player.right(x,y)
        print(player.state)
        end
end

function love.update(dt)
    
    if y >= 410 then 
        y = y + 0
    else y = y + 1
        end

    
    if  love.keyboard.isDown('down')then
         
        y= y + 1
        player.down(x,y-10)
        print(player.state)
        end
    if  love.keyboard.isDown('right')then
        x = x - 1
        end
    if  love.keyboard.isDown('left')then
        x = x + 2
        print(x)
        
        end
    if x >= 750 then
        x = x - 2
        end
    
    if  y > 410 then
        y  = y - 1
        end
    if x < -100 then
    x = x + 2  
        end    
end    

function love.draw()
    love.graphics.draw(sprite,x,y)
end
