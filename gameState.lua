G = {}

local R = require "runes"
local A = require "animals"
local H = require "helpers"
local C = require "content"

local numRunePiecesUsed
local numRunePiecesTotal
local runePlacement
local currentLevel
local runePlacementTarget

function G.load()

    R.load()
    A.load()

    numRunePiecesTotal = 5
    numRunePiecesUsed = 0
    runePlacement = R.resetRuneBoard()
    currentLevel = nil

end

function G.update()

end

function G.draw()
    if currentScene == Scenes.TITLE then
        DrawBackground(backgrounds.TITLE)
    elseif currentScene == Scenes.INTRO then
        DrawBackground(backgrounds.INTRO)
    elseif currentScene == Scenes.RUNES then
        DrawBackground(backgrounds.RUNES)
        DrawTargetRune()
        DrawCurrentRuneLines()
    elseif currentScene == Scenes.ANIMALS then
        DrawBackground(backgrounds.ANIMALS)
        DrawPlaceholders()
        DrawAnimals()
    elseif currentScene == Scenes.HELP then
        DrawBackground(backgrounds.HELP)
    -- elseif currentScene == Scenes.PROGRESS then //Not a current scene
    elseif currentScene == Scenes.GAMEOVER then
        DrawBackground(backgrounds.GAMEOVER)
    end

end

function G.routeMouseInput(mx, my)
    if currentScene == Scenes.TITLE then
    elseif currentScene == Scenes.INTRO then
    elseif currentScene == Scenes.RUNES then
        local buttonPress = CheckButtonsFirst(mx, my)
        if buttonPress == nil then
            local runeIndex = R.isRuneLineClick(mx, my)
            if runeIndex ~= nil then
                R.toggleRune(runeIndex)
            end
        elseif buttonPress == 1 then --submit rune
        elseif buttonPress == 2 then --mute
        elseif buttonPress == 3 then --help
        elseif buttonPress == 4 then --back to map
        elseif buttonPress == 5 and confirmAction then --confirm leave rune
        end
    elseif currentScene == Scenes.ANIMALS then
        if isModal then
            --here we have button presses on the animal modal itself instead of map
        else
            local buttonPress == CheckButtonsFirst(mx, my)
            if buttonPress == 1 then --1-12 are animal indices
            elseif buttonPress == 2 then 
            elseif buttonPress == 3 then
            elseif buttonPress == 4 then
            elseif buttonPress == 5 then
            elseif buttonPress == 6 then
            elseif buttonPress == 7 then
            elseif buttonPress == 8 then
            elseif buttonPress == 9 then
            elseif buttonPress == 10 then
            elseif buttonPress == 11 then
            elseif buttonPress == 12 then
            end
        end
    elseif currentScene == Scenes.HELP then
        if H.isOverlap(mx, my)
    --elseif currentScene == Scenes.PROGRESS then //not currently a scene
    elseif currentScene == Scenes.GAMEOVER then
    end
end

function ToggleRune(r)
    runePlacement[r] = 1 - runePlacement[r]
end

function DrawCurrentRuneLines()
    for k, v in ipairs(runePlacement) do
        if v == 1 then
            local runeToDraw = horizRune
            if (9 % k > 4) or (9 % k == 0) then
                runeToDraw = vertRune
            end
            p = R.getRunePlacement(k)
            love.graphics.draw(runeToDraw, p[1], p[2])
        end
    end
end

function DrawBackground(img)
end

function DrawTargetRune()
end

function DrawPlaceholders()
end

function DrawAnimals()
end

--if a button was pressed return the button index, otherwise return nil
function CheckButtonsFirst()
    --back button
    --confirm button

end

return G