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
local t
local headerFont
local nameFont
local isModal
local prevScene
local isAnimating
local animStart
local totalCorrect
local hasVisitedGameOver
local showError
local showErrorStart
local headerFontSm

local scale

function G.load(db)

    R.load()
    A.load()
    C.load()

    C.playAudio(1)

    numRunePiecesTotal = 5
    numRunePiecesUsed = 0
    runePlacement = R.resetRuneBoard()
    currentLevel = nil

    t = 0
    scale = .5

    headerFont = love.graphics.newFont("/fonts/Courgette-Regular.ttf", 28)
    headerFontSm = love.graphics.newFont("/fonts/Courgette-Regular.ttf", 20)
    nameFont = love.graphics.newFont("/fonts/GloriaHallelujah-Regular.ttf", 36)

    isModal = nil

    if db and CurrentScene == Scenes.RUNES then
        isModal = nil
        currentLevel = 2
    elseif CurrentScene == Scenes.ANIMALS then
        A.markRescued(3)
    end

    soundOff = false
    prevScene = Scenes.ANIMALS

    isAnimating = false
    animStart = 0

    totalCorrect = 0
    hasVisitedGameOver = false

    showError = false
    showErrorStart = 0

end

function G.update()

    t = t + 1

    numRunePiecesUsed = C.getRunePiecesUsed(runePlacement)

    if not C.isAnythingPlaying() then
        C.playAudio(1)
    end

end

function G.draw()
    if CurrentScene == Scenes.TITLE then
        DrawBackground(Scenes.TITLE)
        DrawOtherSprites()
    elseif CurrentScene == Scenes.INTRO then
        DrawBackground(Scenes.TITLE)
        DrawOtherSprites()
    elseif CurrentScene == Scenes.RUNES then
        DrawBackground(Scenes.RUNES)
        DrawCurrentRuneLines()
        DrawOtherSprites()
    elseif CurrentScene == Scenes.ANIMALS then
        DrawBackground(Scenes.ANIMALS)
        DrawAnimals()
        DrawOtherSprites()
    elseif CurrentScene == Scenes.HELP then
        DrawBackground(Scenes.TITLE)
        DrawBackground(Scenes.HELP)
        DrawOtherSprites()
    -- elseif CurrentScene == Scenes.PROGRESS then //Not a current scene
    elseif CurrentScene == Scenes.GAMEOVER then
        DrawBackground(Scenes.GAMEOVER)
    end

end

function G.handleMouseClick(mx, my)
    if CurrentScene == Scenes.TITLE then
        if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), 517, 743, 56, 282) then
            CurrentScene = Scenes.INTRO
        end
    elseif CurrentScene == Scenes.INTRO then
        if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), 600, 780, 500, 580) then
            CurrentScene = Scenes.ANIMALS
        end
    elseif CurrentScene == Scenes.RUNES then
        local buttonPress = CheckButtonsFirst(mx, my)
        if not buttonPress then
            local runeIndex = R.isRuneLineClick(mx, my)
            if runeIndex ~= nil then
                ToggleRune(runeIndex)
            end
        end
    elseif CurrentScene == Scenes.ANIMALS then
        local buttonPress = CheckButtonsFirst(mx, my)
        if isModal then
            return
        end
        if not buttonPress then
            for i=1,13,1 do
                local a = C.getAnimalSprite(i)
                if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), a.x, a.x+(a.w*a.scaleMod*scale), a.y, a.y+(a.h*a.scaleMod*scale)) then
                    isModal = i
                    C.stopAudio()
                    C.playAudio(2)
                    return
                end
            end
        end
    elseif CurrentScene == Scenes.HELP then
        if H.checkOverlap(mx, my, 50, 100, 50, 100) then
            CurrentScene = prevScene
        end
    --elseif CurrentScene == Scenes.PROGRESS then //not currently a scene
    elseif CurrentScene == Scenes.GAMEOVER then
    end
end

function ToggleRune(r)
    runePlacement[r] = 1 - runePlacement[r]
end

function DrawCurrentRuneLines()
    if isAnimating and animStart < 100 then
        love.graphics.setColor(1,1,1,1-animStart/100)
    elseif isAnimating then
        love.graphics.setColor(1,1,1,0)
    end
    for k, v in ipairs(runePlacement) do
        local p = R.getRunePlacement(k)
        if v == 1 then
            local runeToDraw = C.getSprite(20)
            if ((k % 9) > 4) or ((k % 9) == 0) then
                runeToDraw = C.getSprite(23)
            end
            love.graphics.draw(runeToDraw.img, p[1]-16, p[2]-12, 0, scale, scale)
        elseif R.isRuneLineClick(love.mouse.getX(), love.mouse.getY()) == k then

            local runeToDraw = C.getSprite(22)
            if ((k % 9) > 4) or ((k % 9) == 0) then
                runeToDraw = C.getSprite(25)
                love.graphics.draw(runeToDraw.img, p[1]-18, p[2]-2, 0, scale, scale)
            else
                love.graphics.draw(runeToDraw.img, p[1]-6, p[2]-16, 0, scale, scale)
            end

        end
    end
    love.graphics.reset()
end

function DrawBackground(img)
    if CurrentScene ~= Scenes.GAMEOVER then
        love.graphics.draw(C.getSprite(img).img,0,0,0,scale,scale)
    else
        love.graphics.draw(C.getSprite(img).img)
    end
end

function DrawOtherSprites()
    local mx = love.mouse.getX()
    local my = love.mouse.getY()
    if CurrentScene == Scenes.TITLE then
        --title text
        love.graphics.draw(C.getSprite(13).img, 0, 0, 0, scale, scale)
        --attribution before it fades
        if t <= 100 then
            love.graphics.draw(C.getSprite(12).img, 0, 0, 0, scale, scale)
            love.graphics.setColor(1,1,1,1-(t/100))
            love.graphics.draw(C.getSprite(29).img, 0, 0, 0, scale, scale)
            love.graphics.reset()
        else
            love.graphics.draw(C.getSprite(8).img, 0, 0, 0, scale, scale)
            if H.checkOverlap(mx, my, 517, 743, 56, 282) then
                love.graphics.draw(C.getSprite(9).img, 0, 0, 0, scale, scale)
            end
        end
    elseif CurrentScene == Scenes.INTRO then
        DrawBackground(Scenes.INTRO)
        --next button highlight
        if H.checkOverlap(mx, my, 600, 780, 500, 580) then
            love.graphics.draw(C.getSprite(11).img, 0, 0, 0, scale, scale)
        end
        --next button text
        love.graphics.draw(C.getSprite(10).img, 0, 0, 0, scale, scale)
        --text
        love.graphics.setFont(headerFont)
        love.graphics.printf("An evil supervillain has kidnapped all of the animals on your home planet. But you can fight back! You are trained in the ancient art of rune calling: using an animal's rune to summon it.",
            50, 150, 700, "center")
            love.graphics.printf("Summon all of the missing animals back to their natural habitats by recreating the runes you've discovered on your magical stone tablet using your runesticks.",
            50, 360, 700, "center")
    elseif CurrentScene == Scenes.RUNES then
        --back to map
        if H.checkOverlap(mx, my, 0, 140, 0, 80) then
            love.graphics.draw(C.getSprite(15).img, 0, 0, 0, scale, scale)
        end
        love.graphics.draw(C.getSprite(14).img, 0, 0, 0, scale, scale)
        --submit
        if H.checkOverlap(mx, my, 25, 235, 500, 580) then
            love.graphics.draw(C.getSprite(17).img, 0, 480, 0, scale, scale)
        end
        love.graphics.draw(C.getSprite(16).img, 0, 480, 0, scale, scale)
        love.graphics.setFont(headerFont)
        love.graphics.setColor(0,0,0,1)
        love.graphics.printf(C.getNumberPieces(currentLevel) - numRunePiecesUsed, 69, 272, 40, "center")
        love.graphics.reset()

        --draw target rune
        if currentLevel ~= nil then
            love.graphics.draw(C.getRuneSprite(currentLevel).img, 60, 125, 0, scale, scale)
        end

        DrawMenuButtons()

        if isAnimating and animStart < 100 then
            love.graphics.draw(C.getBigRuneSprite(currentLevel).img, 260+(100-animStart), 80+(100-animStart), 0, (.5*(animStart/100)), (.5*(animStart/100)))
            animStart = animStart + 1
        elseif isAnimating and animStart < 200 then
            love.graphics.draw(C.getBigRuneSprite(currentLevel).img, 260, 80, 0, scale, scale)
            animStart = animStart + 1
        elseif isAnimating then
            ResetAll(true)
            return
        end

        if showError and showErrorStart < 100 then
            showErrorStart = showErrorStart + 1
            love.graphics.setFont(headerFontSm)
            love.graphics.setColor(0,0,0,1)
            love.graphics.printf("You've placed "..totalCorrect.." pieces correctly.",304, 520, 400, "center")
            love.graphics.reset()
        elseif showError then
            showError = false
            showErrorStart = 0
        end

    elseif CurrentScene == Scenes.ANIMALS then
        if isModal ~= nil then
            love.graphics.setColor(0,0,0,.8)
            love.graphics.rectangle("fill",0,0,800,600)
            love.graphics.reset()
        --amStart
            if A.isDiscovered(isModal) then
                love.graphics.draw(C.getSprite(35).img, 0, 0, 0, scale, scale)
                local animal = C.getAnimalSprite(isModal)
                local placement = 212 - .25*animal.w
                local py = 290 - .25*animal.h
                love.graphics.draw(C.getAnimalSprite(isModal).img, placement, py, 0, scale, scale)
            else
                love.graphics.draw(C.getSprite(34).img, 0, 0, 0, scale, scale)
                if H.checkOverlap(mx, my, 480, 594, 405, 475) then
                    love.graphics.draw(C.getSprite(31).img, 0, 0, 0, scale, scale)
                end
                love.graphics.draw(C.getSprite(30).img, 0, 0, 0, scale, scale)
            end
            if H.checkOverlap(mx, my, 50, 100, 50, 100) then
                love.graphics.draw(C.getSprite(33).img, 0, 0, 0, scale, scale)
            end
            love.graphics.draw(C.getSprite(32).img, 0, 0, 0, scale, scale)
            --draw animal's rune
            if not A.isDiscovered(isModal) then
                love.graphics.draw(C.getRuneSprite(isModal).img, 456, 230, 0, scale+.1, scale+.1)
            else
                love.graphics.draw(C.getBigRuneSprite(isModal).img, 620, 50, 0, scale*.25, scale*.25)
                love.graphics.setFont(nameFont)
                --love.graphics.printf(A.getName(isModal))
                love.graphics.printf("Fluffy", 300, 160, 300, "center")
                love.graphics.reset()
                love.graphics.setFont(headerFont)
                --love.graphics.printf(A.getDesc(isModal))
            end
        else
            DrawMenuButtons()
        end
    elseif CurrentScene == Scenes.HELP then
        if H.checkOverlap(mx, my, 50, 100, 50, 100) then
            love.graphics.draw(C.getSprite(33).img, 0, 0, 0, scale, scale)
        end
        love.graphics.draw(C.getSprite(32).img, 0, 0, 0, scale, scale)
    -- elseif CurrentScene == Scenes.PROGRESS then //Not a current scene
    elseif CurrentScene == Scenes.GAMEOVER then
        DrawBackground(Scenes.GAMEOVER)
    end
end

function DrawMenuButtons()

    if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), 680, 680+(77*scale), 0, 90*scale) then
        love.graphics.draw(C.getSprite(19).img, 680, 0, 0, scale, scale)
    end
    love.graphics.draw(C.getSprite(18).img, 680, 0, 0, scale, scale)
--sound
    if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), 720, 720+(156*scale), 0, 84*scale) then
        love.graphics.draw(C.getSprite(27).img, 720, 0, 0, scale, scale)
    end
    love.graphics.draw(C.getSprite(26).img, 720, 0, 0, scale, scale)
    if soundOff then
        love.graphics.draw(C.getSprite(28).img, 720, 0, 0, scale, scale)
    end

end

function DrawAnimals()
    for i=1, 13, 1 do
        local p = C.getAnimalHighlight(i)
        local a = C.getAnimalSprite(i)
        local d = A.isDiscovered(i)
        local b = C.getAnimalPlaceholder(i)
        if H.checkOverlap(love.mouse.getX(), love.mouse.getY(), p.x, p.x+(a.w*a.scaleMod*scale), p.y, p.y+(a.h*a.scaleMod*scale))then
            if d then
                love.graphics.draw(p.img, p.x, p.y, 0, scale*a.scaleMod, scale*a.scaleMod)
                love.graphics.draw(a.img, a.x, a.y, 0, scale*a.scaleMod, scale*a.scaleMod)
            else
                local mod = (t%100)*.0001
                local rot = (t%100)*.0001
                if isModal ~= nil then
                    mod = 0
                    rot = 0
                end
                love.graphics.draw(b.img, b.x-mod, b.y-mod, rot, scale*a.scaleMod+mod, scale*a.scaleMod+mod)
            end
        elseif d then
            love.graphics.draw(a.img, a.x, a.y, 0, scale*a.scaleMod, scale*a.scaleMod)
        else
            love.graphics.draw(b.img, b.x, b.y, 0, scale*a.scaleMod, scale*a.scaleMod)
        end
    end
end

function ResetAll(didFinish)
    if didFinish then
        A.markRescued(currentLevel)
        isModal = currentLevel
    end
    animStart = 0
    isAnimating = false
    t = 0
    currentLevel = nil
    totalCorrect = 0
    showError = false
    showErrorStart = 0
    CurrentScene = Scenes.ANIMALS
end

--if a button was pressed return the button index, otherwise return nil
function CheckButtonsFirst(mx, my)
    if CurrentScene == Scenes.ANIMALS and isModal == nil then
        --help button
        if H.checkOverlap(mx, my, 680, 716, 0, 45) then
            CurrentScene = Scenes.HELP
            prevScene = Scenes.ANIMALS
            return true
        end
        --sound button
        if H.checkOverlap(mx, my, 720, 780, 0, 45) then
            soundOff = not soundOff
            if soundOff then
                C.stopAudio()
            else
                C.playAudio(1)
            end
            return true
        end
    elseif CurrentScene == Scenes.ANIMALS then
        if H.checkOverlap(mx, my, 50, 100, 50, 100) then
            isModal = nil
            if A.getRescuedCount() == 13 and not hasVisitedGameOver then
                CurrentScene = Scenes.GAMEOVER
                hasVisitedGameOver = true
            else
                CurrentScene = Scenes.ANIMALS
            end
            return true
        elseif H.checkOverlap(mx, my, 480, 594, 405, 475) then
            currentLevel = isModal
            isModal = nil
            CurrentScene = Scenes.RUNES
            C.stopAudio()
            C.playAudio(1)
            return true
        end
    elseif CurrentScene == Scenes.RUNES then
        --help button
        if H.checkOverlap(mx, my, 680, 716, 0, 45) then
            CurrentScene = Scenes.HELP
            prevScene = Scenes.RUNES
            return true
        end
        --sound button
        if H.checkOverlap(mx, my, 720, 780, 0, 45) then
            soundOff = not soundOff
            if soundOff then
                C.stopAudio()
            else
                C.playAudio(1)
            end
            return true
        end

        --back to map
        if H.checkOverlap(mx, my, 0, 140, 0, 80) then
            ResetAll(false)
        end

        --submit button
        if H.checkOverlap(mx, my, 25, 235, 500, 580) then
            local isCorrect = SubmitAnswer()
            if isCorrect then
                --play happy sound
                C.stopAudio()
                C.playAudio(3)
                --start animation of rune
                isAnimating = true
            else
                showError = true
                C.stopAudio()
                C.playAudio(4)
                lg.printf("Your rune has "..totalCorrect.." pieces placed correctly.",300, 450, 400, "center")
                --play sad sound
                --popover saying x number that is correct
            end
        end
    end

    return false

end

function SubmitAnswer()

    totalCorrect = C.checkCorrectAnswer(runePlacement, currentLevel)

    if totalCorrect == C.getNumberPieces(currentLevel) then
        return true
    else
        return false
    end

end

function G.keyreleased(key, debug)

    if key == "b" and CurrentScene == Scenes.GAMEOVER then
        CurrentScene = Scenes.ANIMALS
        hasVisitedGameOver = true
        return
    end

    if not debug then
        return
    end

    if key == "w" then
        local vals = "{"
        for i=1,39,1 do
            vals = vals ..runePlacement[i]..", "
        end
        vals = vals..runePlacement[40].."}"
        love.system.setClipboardText(vals)
    elseif key == "1" then
            currentLevel = 1
    elseif key == "2" then
        currentLevel = 2
    elseif key == "3" then
        currentLevel = 3
    elseif key == "4" then
        currentLevel = 4
    elseif key == "5" then
        currentLevel = 5
    elseif key == "6" then
        currentLevel = 6
    elseif key == "7" then
        currentLevel = 7
    elseif key == "8" then
        currentLevel = 8
    elseif key == "9" then
        currentLevel = 9
    elseif key == 'u' then
        currentLevel = 10
    elseif key == 'i' then
        currentLevel = 11
    elseif key == "o" then
        currentLevel = 12
    elseif key == "p" then
        currentLevel = 13
    end

end

return G