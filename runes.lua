R = {}

local C = require "content"
local H = require "helpers"

local currentRuneBoard
local emptyRuneMap
local runeDetails
local runeXY
local runePlacement

function R.load()

    --making the map just a flat array will make everything way easier
    emptyRuneMap = {}
    for i=1,40,1 do
        table.insert(emptyRuneMap, 0)
    end

    runeXY = C.loadRuneXY()
    runePlacement = C.loadRunePlacement()
end

function R.update()

end

function R.draw()

end


--Checks to see if a mouse click overlaps a rune line.
--Returns index of rune line, or nil
function R.isRuneLineClick(mx, my)
    for k, v in ipairs(runeXY) do
        if mx >= v[1]-6 and mx <= v[2]+6 then
            if my >= v[3]-6 and my <= v[4]+6 then
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
    return runePlacement[r]
end

--returns empty array
function R.resetRuneBoard()
    return emptyRuneMap
end

return R