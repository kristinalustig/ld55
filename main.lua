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

local debug

DBTXT = ""

function love.load()

    debug = true

    CurrentScene = Scenes.RUNES
    G.load(debug)

end

function love.update()
    G.update()

end

function love.draw()
    G.draw()

    love.graphics.reset()

    if debug == true then
        local x, y = love.mouse.getPosition()
        love.graphics.printf(x..", "..y, x-10, y-10, 100, "left")
        love.graphics.printf(DBTXT, 0, 0, 100, "left")
    end

end

function love.mousereleased(x, y, _, _, _)
    G.handleMouseClick(x, y)
end

function love.keyreleased(key)

    G.keyreleased(key)

end