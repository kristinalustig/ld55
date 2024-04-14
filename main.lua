G = require "gameState"

lg = love.graphics

Scenes = {
    TITLE = 1,
    INTRO = 2,
    RUNES = 3,
    ANIMALS = 4,
    HELP = 5,
    PROGRESS = 6,
    GAMEOVER = 7
}

local CurrentScene
local debug

function love.load()

    debug = true

    CurrentScene = Scenes.RUNES
    G.load()

end

function love.update()
    G.update()

end

function love.draw()
    G.draw()

    if debug == true then
        local x, y = love.mouse.getPosition()
        love.graphics.drawf(x..", "..y, x-10, y-10, 40, "left")
    end

end

function love.mousereleased(x, y, _, _, _)
    G.handleMouseClick(x, y)
end
