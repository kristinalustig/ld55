A = {}

local animals

function A.load()

    animals = {
        slugDog = 1,
        fuzzBall = 2,
        slimeHead = 3,
        flyingTriangle = 4,
        five = 5,
        six = 6,
        seven = 7,
        eight = 8,
        nine = 9,
        ten = 10,
        eleven = 11,
        twelve = 12
    }

    LoadAnimalContent()
    LoadAnimalSprites()

end

function A.update()

end

function A.draw()

end

function A.feedAnimal(a)

end

function A.markRescued(a)

end

function LoadAnimalContent()

end

function LoadAnimalSprites()

end

return A