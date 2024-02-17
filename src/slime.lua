local anim8 = require("libs.anim8")

slime = {}

function slime:new(o)
    o = o or {}
    setmetatable(o,self) 
    self.__index = self 
    self.x = 350
    self.y = 200
    self.image = love.graphics.newImage("resources/slime_sheet.png")
    self.idleAnimationGrid = anim8.newGrid(14,31,self.image:getWidth(),self.image:getHeight())
    self.animations = {
        idleAnimation = anim8.newAnimation(self.idleAnimationGrid('1-10',1),0.1)
    }
    return o
end

function slime:draw()
    self.animations.idleAnimation:draw(self.image,self.x,self.y,nil,1.8,1.8)
    --love.graphics.draw(self.image,50,50)
end

function slime:update(dt)
    self.animations.idleAnimation:update(dt)
end

return slime
