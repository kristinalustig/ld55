R = {}

local C = "content"

local currentRuneBoard
local emptyRuneMap
local runeDetails
local runeXY

function R.load()

    --making the map just a flat array will make everything way easier
    emptyRuneMap = {}
    for i=1,40,1 do 
        table.add(emptyRuneMap, 0)
    end

    runeXY = C.loadRuneXY()
end

function R.update()

end

function R.draw()

end

--Checks to see if a mouse click overlaps a rune line.
--Returns index of rune line, or nil
function R.isRuneLineClick(mx, my)
    for k, v in ipairs(runeXY) do
        if mx >= v[1] and mx <= v[2] then
            if my >= v[3] and my <= v[4] then
                return k 
            end
        end
    end
    return nil
end

function R.checkRunePlacement(answer)
    return answer == currentRuneBoard
end

function R.getRunePlacement(r)
    return runeXY[r]
end

--returns empty array
function R.resetRuneBoard()
    return emptyRuneMap
end

--for each rune, the correct pattern.
function H.loadRunes()
    runeDetails = {}
end

--for each of the 40 rune pieces, creates {x1, x2, y1, y2} for a rectangular click area
--lol hardcoding 40 of these, hooray game jams
function H.loadRuneXY()
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

return R