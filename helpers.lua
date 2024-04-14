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

function H.handleMouseClick(mx, my)

end

function H.getIsTransition()
    return isTransition
end

function H.setIsTransition(val)
    isTransition = val
end

return H