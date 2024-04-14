C = {}

local images
local animalSprites
local animalPlaceholders
local createPlaceholder
local runeSprites
local createBigRune
local animalHighlights

function C.load()
    images = {}
    animalSprites = {}
    animalPlaceholders = {}
    runeSprites = {}
    animalHighlights = {}

    createPlaceholder = false
    createBigRune = false

    --Backgrounds
    table.insert(images, CreateImageObject(Scenes.TITLE, "images/bgTitle", 0, 0))
    table.insert(images, CreateImageObject(Scenes.INTRO, "images/bgIntro", 0, 0))
    table.insert(images, CreateImageObject(Scenes.RUNES, "images/bgRunes", 0, 0))
    table.insert(images, CreateImageObject(Scenes.ANIMALS, "images/bgAnimals", 0, 0))
    table.insert(images, CreateImageObject(Scenes.HELP, "images/bgHelp", 0, 0))
    table.insert(images, "") --keep numbering consistent
    table.insert(images, CreateImageObject(Scenes.GAMEOVER, "images/bgGameover", 0, 0))

    --Misc buttons / highlights
    table.insert(images, CreateImageObject(8, "images/startButton", 0, 0))
    table.insert(images, CreateImageObject(9, "images/startButton-bg", 0, 0))
    table.insert(images, CreateImageObject(10, "images/nextButton", 0, 0))
    table.insert(images, CreateImageObject(11, "images/nextButton-bg", 0, 0))
    table.insert(images, CreateImageObject(12, "images/backButton", 0, 0))
    table.insert(images, CreateImageObject(13, "images/backButton-bg", 0, 0))
    table.insert(images, CreateImageObject(14, "images/backToMapButton", 0, 0))
    table.insert(images, CreateImageObject(15, "images/backToMapButton-bg", 0, 0))
    table.insert(images, CreateImageObject(16, "images/submitButton", 0, 0))
    table.insert(images, CreateImageObject(17, "images/submitButton-bg", 0, 0))
    table.insert(images, CreateImageObject(18, "images/helpButton", 0, 0))
    table.insert(images, CreateImageObject(19, "images/helpButton-bg", 0, 0))

    createBigRune = true

    --runes
    table.insert(runeSprites, CreateImageObject(1, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(2, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(3, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(4, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(5, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(6, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(7, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(8, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(9, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(10, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(11, "images/n", 0, 0))
    table.insert(runeSprites, CreateImageObject(12, "images/n", 0, 0))

    createBigRune = false
    createPlaceholder = true

    --Animals (also create placeholders in method)
    table.insert(animalSprites, CreateImageObject(1, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(2, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(3, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(4, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(5, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(6, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(7, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(8, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(9, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(10, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(11, "images/n", 0, 0))
    table.insert(animalSprites, CreateImageObject(12, "images/n", 0, 0))

end

function C.getSprite(i)
    return images[i]
end

--for each rune, the correct pattern.
function C.loadRunes()
    runeDetails = {}
end

--for each of the 40 rune pieces, creates {x1, x2, y1, y2} for a rectangular click area
--lol hardcoding 40 of these, hooray game jams
function C.loadRuneXY()
    runeXY = {
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0},
        {0,0,0,0}
    }
end

function CreateImageObject(ind, img, x, y)
    local temp = {}
    temp.ind = ind
    temp.img = img .. ".png"
    temp.x = x
    temp.y = y

    --animals only
    if createPlaceholder then 
        --backgrounds on map
        local pt = {}
        pt.ind = ind
        pt.img = img .. "-bg.png"
        pt.x = x
        pt.y = y
        table.insert(animalPlaceholders, pt)
        --highlight backgrounds
        local ht = {}
        ht.ind = ind
        ht.img = img .. "-hlt.png"
        ht.x = x 
        ht.y = y 
        table.insert(animalHighlights, ht)
    end

    --runes only
    if createBigRune then 
        local rt = {}
        rt.ind = ind
        rt.img = img .. "-big.png"
        rt.x = 0
        rt.y = 0
        table.insert(runeSprites, rt)
    end

    return temp 
end

function C.createAnimalBlurb(ind)
    if ind == 1 then
        return ""
    elseif ind == 2 then
        return "" 
    elseif ind == 3 then
        return ""
    elseif ind == 4 then
        return ""
    elseif ind == 5 then
        return ""
    elseif ind == 6 then
        return ""
    elseif ind == 7 then
        return ""
    elseif ind == 8 then
        return ""
    elseif ind == 9 then
        return ""
    elseif ind == 10 then
        return ""
    elseif ind == 11 then
        return ""
    elseif ind == 12 then
        return ""
    end
end

return C