require "socket"

local sprite
local x 
local y 
local virtualWidth = 432
local virtualHeight = 432
local speeed = 10
local  a = 0




local background = {} 
    background["init"] = function()
    love.graphics.setDefaultFilter('nearest','nearest')
     sprite1 = love.graphics.newImage('graphics/background.jpg')
    x1 = 80  
    y1 = 140
    
    end
 --  virtualWidth - sprite1: getWidth() / 2

local player = {}


    player["translateleft"] = function(x,y)
         love.graphics.translate(x,y)
         x1 = x1 - 2
         if  x1 <= -183 then
            x1 = x1 + 2
             end
        end



    player["translateright"] = function(x,y)
        love.graphics.translate(x,y)
        x1 = x1 + 2
        print(x1,"x1")
        end


  
    player["init"] = function()
    love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo.png')
    x = 410
    y = 410
    end





  player["left"] = function(x,y)
    love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo.png') 
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2
    player.state = "up"
    player.face = "left"
    end
  player["right"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogo1.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2
    player.state = "up"
    player.face = "right"
    end


  player["down"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogosleep.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2   
    player.state = "down"
end

player["jump"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogojump.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  
    player.state = "up"
end
player["jumpleft"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogojumpleft.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  
    player.state = "up"
end


-- dont touche this
function love.load() 
     player.init()
     background.init() 
end
function love.keypressed(key)
    local a 

    if key == "up" and player.state == "up" then
        if player.face == "left" then 
            player.jump(x,y)
        print(a)
        end
        if player.face == "right" then 
            player.jumpleft(x,y)
            end
        y  = y - 250         
        end
    if key == 'escape' then 
    love.event.quit()    
        end
     if key == "right" then
        player.left(x,y)
        print(player.state,player.face)
        
        print(y)
        end
     if key == "left" then 
        player.right(x,y)
        print(player.state,player.face)
        end
end

function love.update(dt)
    
    if y >= 410 then 
        y = y + 0
    else y = y + 3
        end
    if  love.keyboard.isDown('down')then
         
        y= y + 1
        
        player.down(x,y + 1000)
        print(player.state)
        print(y)
        end
    if  love.keyboard.isDown('right')then
        player.translateleft(x1,y1) -- test 
        
        end
    if  love.keyboard.isDown('left')then
        player.translateright(x1,y1) -- test
        
        
        end
    if x >= 750 then
        x = x - 2
        end
    
    if  y > 410 and player.state == "up" then
            
            y  = y - 1
            
        end   
    if y > 471.5 and player.state == "down"then 
        y = y - 1
        end
    if x < -100 then
    x = x + 2  
        end    
    if y > 412 and player.face == "left"   then 
        player.left(x,y)
        end
    if y == 410 and player.face == "right" then
        player.right(x,y)
        end 
    if y == 410  and player.face == "left" then
        player.left(x,y)
        end 
end    

function love.draw()
    -- background --
    love.graphics.draw(sprite1,x1,y1)
    -- lane and char --
    love.graphics.draw(sprite,x,y)
   
end
