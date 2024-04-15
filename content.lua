C = {}

local images
local animalSprites
local animalPlaceholders
local createPlaceholder
local runeSprites
local createBigRune
local animalHighlights
local runeSpritesBig
local runeXYPlacement
local runeDetails

local theme
local womp
local ooh
local tada
local animalSounds

function C.load()
    images = {}
    animalSprites = {}
    animalPlaceholders = {}
    runeSprites = {}
    animalHighlights = {}
    runeXYPlacement = {}
    runeSpritesBig = {}
    runeDetails = {}

    theme = love.audio.newSource("audio/theme.mp3", "stream")
    womp = love.audio.newSource("audio/womp.mp3", "static")
    ooh = love.audio.newSource("audio/ooh.mp3", "static")
    tada = love.audio.newSource("audio/tada.mp3", "static")

    animalSounds = {}

    C.loadRunes()

    createPlaceholder = false
    createBigRune = false

    table.insert(animalSounds, love.audio.newSource("audio/m.mp3","static"))--1
    table.insert(animalSounds, love.audio.newSource("audio/e.mp3","static"))--2
    table.insert(animalSounds, love.audio.newSource("audio/f.mp3","static"))--3
    table.insert(animalSounds, love.audio.newSource("audio/h.mp3","static"))--4
    table.insert(animalSounds, love.audio.newSource("audio/b.mp3","static"))--5
    table.insert(animalSounds, love.audio.newSource("audio/d.mp3","static"))--6
    table.insert(animalSounds, love.audio.newSource("audio/l.mp3","static"))--7
    table.insert(animalSounds, love.audio.newSource("audio/a.mp3","static"))--8
    table.insert(animalSounds, love.audio.newSource("audio/i.mp3","static"))--9
    table.insert(animalSounds, love.audio.newSource("audio/c.mp3","static"))--10
    table.insert(animalSounds, love.audio.newSource("audio/g.mp3","static"))--11
    table.insert(animalSounds, love.audio.newSource("audio/j.mp3","static"))--12
    table.insert(animalSounds, love.audio.newSource("audio/k.mp3","static"))--13

    --Backgrounds
    table.insert(images, CreateImageObject(Scenes.TITLE, "images/bgStart", 0, 0))
    table.insert(images, CreateImageObject(Scenes.INTRO, "images/howToPlayText", 0, 0))
    table.insert(images, CreateImageObject(Scenes.RUNES, "images/bgRunes", 0, 0))
    table.insert(images, CreateImageObject(Scenes.ANIMALS, "images/bgAnimals", 0, 0))
    table.insert(images, CreateImageObject(Scenes.HELP, "images/bgStart", 0, 0))
    table.insert(images, "") --keep numbering consistent
    table.insert(images, CreateImageObject(Scenes.GAMEOVER, "images/bgGameOver", 0, 0))

    --Misc buttons / highlights
    table.insert(images, CreateImageObject(8, "images/startButton", 0, 0))
    table.insert(images, CreateImageObject(9, "images/startButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(10, "images/nextButton", 0, 0))
    table.insert(images, CreateImageObject(11, "images/nextButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(12, "images/credits", 0, 0))
    table.insert(images, CreateImageObject(13, "images/titleText", 0, 0))
    table.insert(images, CreateImageObject(14, "images/backToMapButton", 0, 0))
    table.insert(images, CreateImageObject(15, "images/backToMapButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(16, "images/submitButton", 0, 0))
    table.insert(images, CreateImageObject(17, "images/submitButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(18, "images/helpButton", 0, 0))
    table.insert(images, CreateImageObject(19, "images/helpButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(20, "images/runePieceHor", 0, 0))
    table.insert(images, CreateImageObject(21, "images/runePieceHor-hlt", 0, 0))
    table.insert(images, CreateImageObject(22, "images/runePieceHor-bg", 0, 0))
    table.insert(images, CreateImageObject(23, "images/runePieceVer", 0, 0))
    table.insert(images, CreateImageObject(24, "images/runePieceVer-hlt", 0, 0))
    table.insert(images, CreateImageObject(25, "images/runePieceVer-bg", 0, 0))
    table.insert(images, CreateImageObject(26, "images/soundButton", 0, 0))
    table.insert(images, CreateImageObject(27, "images/soundButton-hlt", 0, 0))
    table.insert(images, CreateImageObject(28, "images/soundButton-off", 0, 0))
    table.insert(images, CreateImageObject(29, "images/titleRunes", 0, 0))
    table.insert(images, CreateImageObject(30, "images/am-start", 0, 0))
    table.insert(images, CreateImageObject(31, "images/am-start-hlt", 0, 0))
    table.insert(images, CreateImageObject(32, "images/am-back", 0, 0))
    table.insert(images, CreateImageObject(33, "images/am-back-hlt", 0, 0))
    table.insert(images, CreateImageObject(34, "images/animalModal-bef", 0, 0))
    table.insert(images, CreateImageObject(35, "images/animalModal-aft", 0, 0))

    createBigRune = true

    --runes
    table.insert(runeSprites, CreateImageObject(1, "images/runes/poison", 0, 0))
    table.insert(runeSprites, CreateImageObject(2, "images/runes/leaf", 0, 0))
    table.insert(runeSprites, CreateImageObject(3, "images/runes/wave", 0, 0))
    table.insert(runeSprites, CreateImageObject(4, "images/runes/cloud", 0, 0))
    table.insert(runeSprites, CreateImageObject(5, "images/runes/mountains", 0, 0))
    table.insert(runeSprites, CreateImageObject(6, "images/runes/swirl", 0, 0))
    table.insert(runeSprites, CreateImageObject(7, "images/runes/circles", 0, 0))
    table.insert(runeSprites, CreateImageObject(8, "images/runes/drip", 0, 0))
    table.insert(runeSprites, CreateImageObject(9, "images/runes/pattern", 0, 0))
    table.insert(runeSprites, CreateImageObject(10, "images/runes/flower", 0, 0))
    table.insert(runeSprites, CreateImageObject(11, "images/runes/flame", 0, 0))
    table.insert(runeSprites, CreateImageObject(12, "images/runes/double", 0, 0))
    table.insert(runeSprites, CreateImageObject(13, "images/runes/basic", 0, 0))

    createBigRune = false
    createPlaceholder = true

    --Animals (also create placeholders in method)
    table.insert(animalSprites, CreateImageObject(1, "images/animals/slugDog", 573, 355, 846, 970, .5))
    table.insert(animalSprites, CreateImageObject(2, "images/animals/fuzzBall", 635, 50, 780, 801, .4))
    table.insert(animalSprites, CreateImageObject(3, "images/animals/slimeHead", 273, 442, 564, 634, .4))
    table.insert(animalSprites, CreateImageObject(4, "images/animals/flyingTriangle", 290, 0, 1035, 441, .4))
    table.insert(animalSprites, CreateImageObject(5, "images/animals/happyStalk", 17, 306, 1008, 712, .5))
    table.insert(animalSprites, CreateImageObject(6, "images/animals/moebius", 428, 449, 604, 640, .5))
    table.insert(animalSprites, CreateImageObject(7, "images/animals/eyeBlob", 0, 0, 611, 541, .5))
    table.insert(animalSprites, CreateImageObject(8, "images/animals/wiggleCat", 17, 506, 987, 526, .45))
    table.insert(animalSprites, CreateImageObject(9, "images/animals/blocky", 17, 137, 748, 651, .4))
    table.insert(animalSprites, CreateImageObject(10, "images/animals/jellina", 387, 105, 529, 764, .36))
    table.insert(animalSprites, CreateImageObject(11, "images/animals/coolCarrot", 505, 6, 377, 687, .6))
    table.insert(animalSprites, CreateImageObject(12, "images/animals/twins", 485, 226, 668, 364, .7))
    table.insert(animalSprites, CreateImageObject(13, "images/animals/oozyEye", 241, 179, 521, 413, .5))

end

function C.playAudio(n)
    if soundOff then return end
    if n == 1 then
        theme:play()
        theme:setLooping(true)
    elseif n == 2 then
        ooh:play()
    elseif n == 3 then
        tada:play()
    elseif n == 4 then
        womp:play()
    end
end

function C.playAnimalSound(i)
    if soundOff then return end
    animalSounds[i]:play()
end

function C.stopAudio()
    theme:stop()
    ooh:stop()
    tada:stop()
    womp:stop()
    for k, v in ipairs(animalSounds) do
        v:stop()
    end
end

function C.isAnythingPlaying()
    return theme:isPlaying() or womp:isPlaying() or tada:isPlaying() or ooh:isPlaying()
end

function C.startAudio()
    theme:play()
    theme:setLooping(true)
end

function C.getSprite(i)
    return images[i]
end

function C.getAnimalSprite(i)
    return animalSprites[i]
end

function C.getAnimalHighlight(i)
    return animalHighlights[i]
end

function C.getAnimalPlaceholder(i)
    return animalPlaceholders[i]
end

function C.getRuneSprite(i)
    return runeSprites[i]
end

function C.getBigRuneSprite(i)
    return runeSpritesBig[i]
end

function C.getNumberPieces(i)
    if i == nil then
        return 0
    end
    local c = 0
    for j=1, 40, 1 do
        if runeDetails[i][j] == 1 then
            c = c + 1
        end
    end
    return c
end

function C.checkCorrectAnswer(ans, num)
    local correct = 0
    for i=1,40,1 do
        if ans[i] == runeDetails[num][i] and ans[i] == 1 then
            correct = correct + 1
        end
    end
    return correct

end

function C.getRunePiecesUsed(r)
    if r == nil then
        return 0
    end
    local c = 0
    for j=1, 40, 1 do
        if r[j] == 1 then
            c = c + 1
        end
    end
    return c
end


--for each rune, the correct pattern.
function C.loadRunes()
    runeDetails = {
        {1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
        {1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
        {0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1},
        {0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0},
        {1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1},
        {0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1},
        {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1},
        {0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1},
        {1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1},
        {0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1},
        {0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }
end

--for each of the 40 rune pieces, creates {x1, x2, y1, y2} for a rectangular click area
--lol hardcoding 40 of these, hooray game jams
function C.loadRuneXY()
    local row1Ys = 90
    local row1Yf = 108
    local row2Ys = 186
    local row2Yf = 206
    local row3Ys = 288
    local row3Yf = 310
    local row4Ys = 396
    local row4Yf = 418
    local row5Ys = 490
    local row5Yf = 516

    local col1Xs = 288
    local col1Xf = 308
    local col2Xs = 386
    local col2Xf = 410
    local col3Xs = 488
    local col3Xf = 514
    local col4Xs = 590
    local col4Xf = 614
    local col5Xs = 690
    local col5Xf = 712


    runeXY = {
        {col1Xf+1, col2Xs-1,row1Ys, row1Yf},--r#1
        {col2Xf+1, col3Xs-1,row1Ys, row1Yf},--r#2
        {col3Xf+1, col4Xs-1,row1Ys, row1Yf},--r#3
        {col4Xf+1, col5Xs-1,row1Ys, row1Yf},--r#4
        {col1Xs, col1Xf,row1Yf+1, row2Ys-1},--r#5
        {col2Xs, col2Xf,row1Yf+1, row2Ys-1},--r#6
        {col3Xs, col3Xf,row1Yf+1, row2Ys-1},--r#7
        {col4Xs, col4Xf,row1Yf+1, row2Ys-1},--r#8
        {col5Xs, col5Xf,row1Yf+1, row2Ys-1},--r#9
        {col1Xf+1, col2Xs-1,row2Ys, row2Yf},--r#10
        {col2Xf+1, col3Xs-1,row2Ys, row2Yf},--r#11
        {col3Xf+1, col4Xs-1,row2Ys, row2Yf},--r#12
        {col4Xf+1, col5Xs-1,row2Ys, row2Yf},--r#13
        {col1Xs, col1Xf,row2Yf+1, row3Ys-1},--r#14
        {col2Xs, col2Xf,row2Yf+1, row3Ys-1},--r#15
        {col3Xs, col3Xf,row2Yf+1, row3Ys-1},--r#16
        {col4Xs, col4Xf,row2Yf+1, row3Ys-1},--r#17
        {col5Xs, col5Xf,row2Yf+1, row3Ys-1},--r#18
        {col1Xf+1, col2Xs-1,row3Ys, row3Yf},--r#19
        {col2Xf+1, col3Xs-1,row3Ys, row3Yf},--r#20
        {col3Xf+1, col4Xs-1,row3Ys, row3Yf},--r#21
        {col4Xf+1, col5Xs-1,row3Ys, row3Yf},--r#22
        {col1Xs, col1Xf,row3Yf+1, row4Ys-1},--r#23
        {col2Xs, col2Xf,row3Yf+1, row4Ys-1},--r#24
        {col3Xs, col3Xf,row3Yf+1, row4Ys-1},--r#25
        {col4Xs, col4Xf,row3Yf+1, row4Ys-1},--r#26
        {col5Xs, col5Xf,row3Yf+1, row4Ys-1},--r#27
        {col1Xf+1, col2Xs-1,row4Ys, row4Yf},--r#28
        {col2Xf+1, col3Xs-1,row4Ys, row4Yf},--r#29
        {col3Xf+1, col4Xs-1,row4Ys, row4Yf},--r#30
        {col4Xf+1, col5Xs-1,row4Ys, row4Yf},--r#31
        {col1Xs, col1Xf,row4Yf+1, row5Ys-1},--r#32
        {col2Xs, col2Xf,row4Yf+1, row5Ys-1},--r#33
        {col3Xs, col3Xf,row4Yf+1, row5Ys-1},--r#34
        {col4Xs, col4Xf,row4Yf+1, row5Ys-1},--r#35
        {col5Xs, col5Xf,row4Yf+1, row5Ys-1},--r#36
        {col1Xf+1, col2Xs-1,row5Ys, row5Yf},--r#37
        {col2Xf+1, col3Xs-1,row5Ys, row5Yf},--r#38
        {col3Xf+1, col4Xs-1,row5Ys, row5Yf},--r#39
        {col4Xf+1, col5Xs-1,row5Ys, row5Yf}--r#40
    }

    return runeXY
end

function C.loadRunePlacement()

    local col1x = 298
    local col2x = 398
    local col3x = 498
    local col4x = 598
    local col5x = 698

    local row1y = 91
    local row2y = 191
    local row3y = 291
    local row4y = 391
    local row5y = 491

    local temp = {
        {col1x, row1y},--r#1
        {col2x, row1y},--r#2
        {col3x, row1y},--r#3
        {col4x, row1y},--r#4
        {col1x, row1y},--r#5
        {col2x, row1y},--r#6
        {col3x, row1y},--r#7
        {col4x, row1y},--r#8
        {col5x, row1y},--r#9
        {col1x, row2y},--r#10
        {col2x, row2y},--r#11
        {col3x, row2y},--r#12
        {col4x, row2y},--r#13
        {col1x, row2y},--r#14
        {col2x, row2y},--r#15
        {col3x, row2y},--r#16
        {col4x, row2y},--r#17
        {col5x, row2y},--r#18
        {col1x, row3y},--r#19
        {col2x, row3y},--r#20
        {col3x, row3y},--r#21
        {col4x, row3y},--r#22
        {col1x, row3y},--r#23
        {col2x, row3y},--r#24
        {col3x, row3y},--r#25
        {col4x, row3y},--r#26
        {col5x, row3y},--r#27
        {col1x, row4y},--r#28
        {col2x, row4y},--r#29
        {col3x, row4y},--r#30
        {col4x, row4y},--r#31
        {col1x, row4y},--r#32
        {col2x, row4y},--r#33
        {col3x, row4y},--r#34
        {col4x, row4y},--r#35
        {col5x, row4y},--r#36
        {col1x, row5y},--r#37
        {col2x, row5y},--r#38
        {col3x, row5y},--r#39
        {col4x, row5y}--r#40
    }

    return temp
end

function CreateImageObject(ind, img, x, y, w, h, scaleMod)
    local temp = {}
    temp.ind = ind
    temp.img = love.graphics.newImage(img .. ".png")
    temp.x = x
    temp.y = y

    --animals only
    if createPlaceholder then
        temp.w = w
        temp.h = h
        temp.scaleMod = scaleMod
        --backgrounds on map
        local pt = {}
        pt.ind = ind
        pt.img = love.graphics.newImage(img .. "-bg.png")
        pt.x = x
        pt.y = y
        table.insert(animalPlaceholders, pt)
        --highlight backgrounds
        local ht = {}
        ht.ind = ind
        ht.img = love.graphics.newImage(img .. "-hlt.png")
        ht.x = x
        ht.y = y
        table.insert(animalHighlights, ht)
    end

    --runes only
    if createBigRune then
        local rt = {}
        rt.ind = ind
        rt.img = love.graphics.newImage(img .. "-big.png")
        rt.x = 0
        rt.y = 0
        table.insert(runeSpritesBig, rt)
    end

    return temp
end

function C.createAnimalBlurb(ind)
   return ""
end

return C