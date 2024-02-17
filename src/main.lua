local player = require("player")
local slimes = require("slime")
function love.load()
    background = love.graphics.newImage("resources/orig.png")
    love.graphics.setDefaultFilter("nearest","nearest")
    --set window title
    love.window.setTitle("SlimeHero")
    --set window width and height
    love.window.setMode(576,324)
    player:init()
    slime1 = slimes:new()
end

function love.draw()
    love.graphics.draw(background,0,0)
    player:draw()
    slime1:draw()
end

function love.update(dt)
    player:update(dt)
    slime1:update(dt)
end
