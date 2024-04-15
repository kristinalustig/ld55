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

soundOff = false

DBTXT = ""

function love.load()

    debug = false

    CurrentScene = Scenes.TITLE
    if debug == true then
        CurrentScene = Scenes.ANIMALS
    end
    G.load(debug)

end

function love.update()
    G.update()

end

function love.draw()
    G.draw()

    love.graphics.reset()

    if debug == true then
        love.graphics.setColor(0,0,0,1)
        local x, y = love.mouse.getPosition()
        love.graphics.printf(x..", "..y, x-10, y-10, 100, "left")
        love.graphics.printf(DBTXT, 0, 0, 100, "left")
        love.graphics.reset()
    end

end

function love.mousereleased(x, y, _, _, _)
    G.handleMouseClick(x, y)
end

function love.keyreleased(key)

    G.keyreleased(key, debug)

end