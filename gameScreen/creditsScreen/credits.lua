local screen = {}

local _W = display.contentWidth
local _H = display.contentHeight

local creditsGroup
local dev


function removeCreditsGroup()
	creditsGroup:removeSelf()
	creditsGroup = nil
end

function screen.credits()
	creditsGroup = display.newGroup()

	local class = {}

	class.creditsBack = false

	local function keyTouch(event)
		if ( event.keyName == "back" and event.phase == "up" ) then

			Runtime:removeEventListener("key", keyTouch)
			removeCreditsGroup()
			class.creditsBack = true


	        local platformName = system.getInfo( "platformName" )
	        print("back is pressed")
	        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
	            return true
	        end
	    end
	    return false
	end

	local name = "Faust Heinrich Tan"
	
	background = display.newImage("images/mmbackground.png", 0, 0)

	name = display.newText(name, _W/2, _H/2, "Comic Sans MS", 30)
	name:setFillColor(1, 1, 1)
	dev = display.newText("Developer", _W/2, _H/2 + 30, "Comic Sans MS", 15)
	dev:setFillColor(0, 0, 1)

	Runtime:addEventListener("key", keyTouch)

	creditsGroup:insert(background)
	creditsGroup:insert(name)
	creditsGroup:insert(dev)

	return class
end

return screen
