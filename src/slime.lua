local anim8 = require("libs.anim8")

slime = {}

function slime:new(o)
    o = o or {}
    setmetatable(o,self) 
    self.__index = self 
    self.x = 350
    self.y = 200
    self.jumpStrength = -20 -- Jump strength
    self.groundLevel = 200 -- Y position of the ground
    self.ceilingLevel = 180
    self.image = love.graphics.newImage("resources/slime_sheet.png")
    self.idleAnimationGrid = anim8.newGrid(12,31,self.image:getWidth(),self.image:getHeight())
    self.animations = {
        idleAnimation = anim8.newAnimation(self.idleAnimationGrid('1-10',1),0.1)
    }
    self.hasJumped = false
    return o
end

function slime:draw()
    self.animations.idleAnimation:draw(self.image,self.x,self.y,nil,1.8,1.8)
    --love.graphics.draw(self.image,50,50)
end

function slime:update(dt)
    self.animations.idleAnimation:update(dt)
    --[[
        if self.y > self.ceilingLevel and not self.hasJumped then
        self.y = self.y + self.jumpStrength
    elseif self.y == self.ceilingLevel then
        self.y = self.y - (self.jumpStrength)
        self.hasJumped = true 
        if self.y >= self.groundLevel then
            self.hasJumped = false
        end
    end

    ]]--
    self.x = self.x - 0.2
    if self.x < 0 then 
        self.x = 450
    end
end

return slime
