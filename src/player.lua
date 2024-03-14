local anim8 = require("libs.anim8")

player={}

function player:init()
    --initialize player table
    player.image = love.graphics.newImage("resources/adventurer-sheet-2.png")
    player.idleGrid = anim8.newGrid(21,31,player.image:getWidth(),player.image:getHeight())
    player.walkGrid = anim8.newGrid(24,34,player.image:getWidth(),player.image:getHeight())
    player.attackGrid = anim8.newGrid(38,33,player.image:getWidth(),player.image:getHeight())
    player.x = 50
    player.y = 200
    player.animations = {
        idleAnimation = anim8.newAnimation(player.idleGrid('1-4',1),0.1),
        walkAnimation = anim8.newAnimation(player.walkGrid('2-7',2),0.1),
        fightAnimation = anim8.newAnimation(player.attackGrid('1-6',9),0.1)
    }
    player.isIdling = true
    player.isWalking = false
    player.isAttacking = false
    player.facingRight = true
    player.scaleX = 2
    player.scaleY = 2
end

function player:draw()
    --draw idling or walking animations
    if player.isIdling then
        player.animations.idleAnimation:draw(player.image,player.x,player.y,nil,player.scaleX,player.scaleY)
        player.isWalking = false
        player.isAttacking = false
    elseif player.isWalking then
        player.animations.walkAnimation:draw(player.image,player.x,player.y,nil,player.scaleX,player.scaleY)
        player.isIdling = false
        player.isAttacking = false
    elseif player.isAttacking then
        player.isWalking = false
        player.isIdling = false
        player.animations.fightAnimation:draw(player.image,player.x,player.y,nil,player.scaleX,player.scaleY)
    end
end

function player:update(dt)
    --update animations
    player.animations.idleAnimation:update(dt)
    player.animations.walkAnimation:update(dt)
    player.animations.fightAnimation:update(dt)

    --keyboard input checks
    if love.keyboard.isDown("d") then
        player.x = player.x + 2
        player.isWalking = true
        player.isIdling = false
        player.isAttacking = false
        player.facingRight = true
    elseif love.keyboard.isDown("a") then
        player.x = player.x - 2
        player.isWalking = true
        player.isIdling = false
        player.isAttacking = false
        player.facingRight = false
    elseif love.keyboard.isDown("x") then 
        player.isAttacking = true
        player.isWalking = false
        player.isIdling = false
    else
        player.isIdling = true
        player.isWalking = false
        player.isAttacking = false
    end

    --if facing right (when d is pressed on keyboard), then face the player right
    if player.facingRight then
        player.scaleX = 2
    else
        player.scaleX = -2
    end
end

return player
