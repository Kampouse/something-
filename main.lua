local sti = require 'sti'

local sprite
local x 
local y 
local virtualWidth = 432
local virtualHeight = 432
local speeed = 10
local  a = 0
local map



local background = {} 
    background["init"] = function()
    love.graphics.setDefaultFilter('nearest','nearest')
     sprite1 = love.graphics.newImage('graphics/background.jpg')
    x1 = 80  
    y1 = 140
    
    end
 --  virtualWidth - sprite1: getWidth() / 2

local player = {}

    player["text_init"] = function()
       
        love.graphics.setDefaultFilter('nearest','nearest')
        talks = love.graphics.newImage('graphics/talks.png')
        player.talk = "TRUE"
     end

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
    player.state = "up"
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



player["jumpleft"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogojump.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  
    player.state = "up"
    player.face = "left"
end

player["jump"] = function(x,y)
  love.graphics.setDefaultFilter('nearest','nearest')
     sprite = love.graphics.newImage('graphics/dogojumpleft.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  
    player.state = "up"
    player.face = "right"
end


local blocks = {}


blocks["init"] = function(x1,y1)
  love.graphics.setDefaultFilter('nearest','nearest')
     block = love.graphics.newImage('graphics/block.png')
    x = virtualWidth - sprite: getWidth() / 2
    y = virtualHeight - sprite: getHeight() / 2  
    print("meh")
    end



blocks["collision"] = function()
if  y >= 130 and y <= 140  then -- height
    if x1 > 0 and x1 < 406 then -- left and right
        if player.state == "up" then --  state for the player
            if player.face == "left" then --  where are they looking
               player.left(x,y)
            else player.right(x,y) 
                end 
                y = y - 2    -- how its stand the rest is for the corner    
            end
        end
else print("x1",x1,"y1",y1)
    end
end 






-- dont touche this

function love.load()
    map = sti("map1.lua")


end
function love.load() 
    
     player.init()
     background.init()
     player.text_init()
     blocks.init()
    
end
function love.keypressed(key)
    local a 

    if key == "up" and player.state == "up" then
        if player.face == "right" then 
            player.jump(x,y)
            end
        if player.face == "left" then
            player.jumpleft(x,y)
             end



        print(a)
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
map:update(dt)
end
    
function love.update(dt)
     
    if y >= 460 and player.state == "down"  then
        y = y - 2
        end
    if y >= 410 and player.state == "up"  then
         

        y = y + 0      
    else  y = y + 2
        end
    if y > 413 and player.state == "up" then 
        y = y - 20
        end
    if  y == 0 and player.state == "up" then
        if player.state == "down" then
            y = y - 20
            end
        y =  y - 2
            
                 
        end
    if  love.keyboard.isDown('down')then
         
        y= y 
        
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
    if y >= 410 and player.face == "left"  then 
        if player.state == "up" then    
            player.left(x,y)
            end
        end
    if y >= 410 and player.face == "right" then
        if player.state == "up" then
        player.right(x,y)
            end
        end 
    
    if y > 400 and player.state == "down" then
        if player.face == "left" or "right" then
            player.down(x,y)
            
            end
        end

    blocks.collision()  
end    
 function love.draw()
     map:draw()
     end
function love.draw()
    -- background --
    love.graphics.draw(sprite1,x1,y1)
    love.graphics.draw(block,x1,250)
    -- lane and char --
    
    love.graphics.draw(sprite,x,y)
  if player.state == "up" then  
        if x1 <= -2 and x1 > -100  then 
            love.graphics.draw(talks,x - 80 ,y - 125)
            player.talk = "true"
            print(player.talk)
                if x1 > -50  and x1 < -60 then
                    love.graphics.draw(talks,x - 80 ,y - 125)
                    
                    end

            else player.talk = "false"
                   
         
            end
         
     end


end
