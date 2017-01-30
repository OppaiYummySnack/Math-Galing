local mmClass
local playClass
local diffClass
local creditsClass

local difficulty = 1

function closeapp()
       if  system.getInfo("platformName")=="Android" then
           native.requestExit()
       else
           os.exit() 
      end
end

function exit( event )

	if ( event.keyName == "back" and event.phase == "up" ) then

		Runtime:removeEventListener("key", exit)
	    timer.performWithDelay(1000,closeapp)


        local platformName = system.getInfo( "platformName" )
        print("back is pressed")
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
    end
    return false
end  

function ifClicked(event)
	--Play
	if mmClass.play == true then
		Runtime:removeEventListener("key", exit)
		Runtime:removeEventListener("enterFrame", ifClicked)
		mmClass.removeGroup()
		playClass = require("gameScreen.playScreen.play").play(difficulty)

		local function gotoMainMenu()
			if playClass.playBack == true then
				Runtime:removeEventListener("enterFrame", gotoMainMenu)
				main()
			end
		end
		Runtime:addEventListener("enterFrame", gotoMainMenu)
	end

	-- difficulty
	if mmClass.diff == true then
		Runtime:removeEventListener("key", exit)
		Runtime:removeEventListener("enterFrame", ifClicked)
		mmClass.removeGroup()
		diffClass = require("gameScreen.difficultyScreen.difficulty").changeDifficulty()

		local function gotoMainMenu()
			if diffClass.changed == true then
				Runtime:removeEventListener("enterFrame", gotoMainMenu)
				difficulty = diffClass.diff
				main()
			end
			if diffClass.difficultyBack == true then
				Runtime:removeEventListener("enterFrame", gotoMainMenu)
				main()
			end
		end
		Runtime:addEventListener("enterFrame", gotoMainMenu)
	end

	--credits
	if mmClass.credits == true then
		Runtime:removeEventListener("key", exit)
		Runtime:removeEventListener("enterFrame", ifClicked)
		mmClass.removeGroup()
		creditsClass = require("gameScreen.creditsScreen.credits").credits()

		local function gotoMainMenu()
			if creditsClass.creditsBack == true then
				Runtime:removeEventListener("enterFrame", gotoMainMenu)
				main()
			end
		end
		Runtime:addEventListener("enterFrame", gotoMainMenu)
	end	
end




function main()
	mmClass = require("gameScreen.mmScreen.mmScreen").mmScreen()
	Runtime:addEventListener("enterFrame", ifClicked)
	Runtime:addEventListener("key", exit)
end

main()