local screen = {}

local diffGroup
local easy
local medium
local hard
local insane

local _W = display.contentWidth
local _H = display.contentHeight


function screen.changeDifficulty()
	local class = {}

	class.difficultyBack = false

	class.changed = false
	diffGroup = display.newGroup()

	local function removeGroup()
		diffGroup:removeSelf()
		diffGroup = nil
	end

	
	local function keyTouch(event)
		if ( event.keyName == "back" and event.phase == "up" ) then

			Runtime:removeEventListener("key", keyTouch)
			removeGroup()
			class.difficultyBack = true


	        local platformName = system.getInfo( "platformName" )
	        print("back is pressed")
	        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
	            return true
	        end
	    end
	    return false
	end
	
	local function diffEasy()
		class.diff = 1
		class.changed = true
		removeGroup()
	end
	local function diffMedium()
		class.diff = 2
		class.changed = true
		removeGroup()
	end
	local function diffHard()
		class.diff = 3
		class.changed = true
		removeGroup()
	end
	local function diffInsane()
		class.diff = 4
		class.changed = true
		removeGroup()
	end

	background = display.newImage("images/mmbackground.png", 0, 0)

	easy = display.newImage("images/easy.png")
	easy.x = _W/2; easy.y = 10+easy.height

	medium = display.newImage("images/medium.png")
	medium.x = _W/2; medium.y = 10+easy.height+medium.height

	hard = display.newImage("images/hard.png")
	hard.x = _W/2; hard.y = 10+easy.height+medium.height+hard.height

	insane = display.newImage("images/insane.png")
	insane.x = _W/2; insane.y = 10+easy.height+medium.height+hard.height+insane.height

	easy:addEventListener("tap", diffEasy)
	medium:addEventListener("tap", diffMedium)
	hard:addEventListener("tap", diffHard)
	insane:addEventListener("tap", diffInsane)


	diffGroup:insert(background)
	diffGroup:insert(easy)
	diffGroup:insert(medium)
	diffGroup:insert(hard)
	diffGroup:insert(insane)

	Runtime:addEventListener("key", keyTouch)

	return class
end

return screen