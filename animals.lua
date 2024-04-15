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

function A.update()

end

function A.draw()

end

function A.feedAnimal(a)

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