A = {}

local animals

function A.load()

    animals = {
        slugDog = 1,
        fuzzBall = 2,
        slimeHead = 3,
        flyingTriangle = 4,
        happyStalk = 5,
        moebius = 6,
        eyeBlob = 7,
        wiggleCat = 8,
        blocky = 9,
        jellina = 10,
        coolCarrot = 11,
        twins = 12,
        oozyEye = 13
    }

    LoadAnimalContent()

end

function A.getAnimalName(ind)
    if ind == 1 then
        return "Gloopus"
    elseif ind == 2 then
        return "Frizzle"
    elseif ind == 3 then
        return "Wiggler"
    elseif ind == 4 then
        return "Illuminina"
    elseif ind == 5 then
        return "Gulpor"
    elseif ind == 6 then
        return "Moebius"
    elseif ind == 7 then
        return "Omnia"
    elseif ind == 8 then
        return "Catterpixi"
    elseif ind == 9 then
        return "Bricko"
    elseif ind == 10 then
        return "Juliefish"
    elseif ind == 11 then
        return "Carrino"
    elseif ind == 12 then
        return "Duoliver"
    elseif ind == 13 then
        return "Bloogle"
    end

end

function A.getAnimalInfo(ind)
    if ind == 1 then
        return "A Gloopus pulls its hind tail along with the formidable strength in its forelegs."
    elseif ind == 2 then
        return "Frizzles are so light that they get caught in even the slightest breeze."
    elseif ind == 3 then
        return "Wigglers like to tickle unsuspecting travelers' toes when they cross their rivers."
    elseif ind == 4 then
        return "Very mysterious; not much is known about Illuminina except that its wings are very fragile."
    elseif ind == 5 then
        return "Particularly large Gulpors have been known to eat rocks the size of their own eyeballs in one gulp."
    elseif ind == 6 then
        return "Sometimes even a Moebius gets confused about which side is its front."
    elseif ind == 7 then
        return "Legend has it that at any given point, there is always an Omnia that can see you."
    elseif ind == 8 then
        return "Finding a Catterpixi inching up the side of your home is considered a good omen in many cultures."
    elseif ind == 9 then
        return "Sometimes a Bricko surprises unsuspecting prey by blending in with surrounding buildings."
    elseif ind == 10 then
        return "Sailors can use a Juliefish's glow to find their way back to shore if lost at sea."
    elseif ind == 11 then
        return "It looks like Carrinos wear glasses, but actually they just have several oddly-shaped limbs."
    elseif ind == 12 then
        return "The two halves of a Duoliver take turns being right-side-up each day."
    elseif ind == 13 then
        return "When a Bloogle is extra happy, it spins its eyeblobs around in big circles."
    end

end

function A.markRescued(a)
    animals[a].isDiscovered = true
end

function A.getRescuedCount()
    local r = 0
    for i=1,13,1 do
        if animals[i].isDiscovered then
            r = r + 1
        end
    end
    return r
end

function A.isDiscovered(i)
    return animals[i].isDiscovered
end

function LoadAnimalContent()
    for i=1, 13, 1 do
        animals[i] = {}
        animals[i].isDiscovered = false
    end
end

return A