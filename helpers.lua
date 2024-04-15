H = {}

local currMouseX
local currMouseY
local isTransition

function H.load()
    isTransition = false
end

function H.animateSprite(dt, frame)

end

function H.animateTransition(dt, frame)

end

function H.getMouseLoc(mx, my)

end

function H.checkOverlap(mx, my, x1, x2, y1, y2)
    return mx >= x1 and mx <= x2 and my >= y1 and my <= y2
end

function H.getIsTransition()
    return isTransition
end

function H.setIsTransition(val)
    isTransition = val
end

return H