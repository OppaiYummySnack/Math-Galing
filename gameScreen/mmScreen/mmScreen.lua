local screen = {}


local mmGroup
local background
local titleLine1
local titleLine2
local playText
local changeDifficulty
local credit
local _W = display.contentWidth
local _H = display.contentHeight

--[[
function screen.changeDifficulty()
	local playClass = require "gameScreen.difficultyScreen.difficulty"
end

function credits()
	loca creditsClass = require "gameScreen.creditsScreen.credits"
end
]]--
function screen.mmScreen()
	local class = {}
	class.play = false
	class.diff = false
	class.credits = false
	local function played()
		class.play = true
	end

	local function diff()
		class.diff = true
	end

	local function cred()
		class.credits = true
	end

	function class.removeGroup()
		if class.play == true then
			mmGroup:removeSelf()
			mmGroup = nil
		end
		if class.diff == true then
			mmGroup:removeSelf()
			mmGroup = nil
		end
	end

	mmGroup = display.newGroup()

	background = display.newImage("images/mmbackground.png", 0, 0)

	titleLine1 = display.newText("M A T H", _W/2, 60, "Comic Sans MS", 60)
	titleLine1:setFillColor(1, 1, 1)

	titleLine2 = display.newText("G A L I N G", _W/2, 120, "Comic Sans MS", 30)
	titleLine2:setFillColor(1, 1, 1)

	playText = display.newText("P L A Y", _W/2, _H/2, "Comic Sans MS", 30)
	playText:setFillColor(0, 1, 0)

	changeDifficulty = display.newText("D I F F I C U L T Y", _W/2, _H/2 + 60, "Comic Sans MS", 30)
	changeDifficulty:setFillColor(1, 0, 0)

	credit = display.newText("C R E D I T S", _W/2, _H/2 + 120, "Comic Sans MS", 30)
	credit:setFillColor(1, 1, 1)

	playText:addEventListener("tap", played)
	changeDifficulty:addEventListener("tap", diff)
	credit:addEventListener("tap", cred)

	mmGroup:insert(background)
	mmGroup:insert(titleLine1)
	mmGroup:insert(titleLine2)
	mmGroup:insert(playText)
	mmGroup:insert(changeDifficulty)
	mmGroup:insert(credit)

	return class
end


return screen