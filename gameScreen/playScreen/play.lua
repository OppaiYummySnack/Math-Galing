local screen = {}

local playGroup
local fnum
local snum
local operator
local taps
local allOperator = {"+", "-", "*", "/"}
local answer
local _W = display.contentWidth
local _H = display.contentHeight

function getRand()
	local fnum = math.random(0, 100)
	local snum = math.random(0, 100)

	return fnum, snum
end

function getAnswer(rand)
	if rand == 1 then
		answer = fnum + snum
	elseif rand == 2 then
		answer = fnum - snum
	elseif rand == 3 then
		answer = fnum * snum
	elseif rand == 4 then
		answer = fnum / snum
		answer = math.ceil(answer)
	end
end

function removePlayGroup()
	playGroup:removeSelf()
	playGroup = nil
end

function screen.play(difficultyNumber)
	local taps = 0
	
	playGroup = display.newGroup()

	local class = {}


	class.playBack = false

	local function keyTouch(event)

		if ( event.keyName == "back" and event.phase == "up" ) then

			
			Runtime:removeEventListener("key", keyTouch)
			removePlayGroup()
			class.playBack = true


	        local platformName = system.getInfo( "platformName" )
	        print("back is pressed")
	        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
	            return true
	        end
	    end
	    return false
	end

	fnum, snum = getRand()


	local function getOperator()
		local rand
		if difficultyNumber == 1 then
			operator = allOperator[1]
			answer = fnum + snum
		elseif difficultyNumber == 2 then
			rand = math.random(1, difficultyNumber)
			operator = allOperator[rand]
			getAnswer(rand)
		elseif difficultyNumber == 3 then
			rand = math.random(1, difficultyNumber)
			operator = allOperator[rand]
			getAnswer(rand)
		elseif difficultyNumber == 4 then
			rand = math.random(1, difficultyNumber)
			operator = allOperator[rand]
			getAnswer(rand)
		end
	end

	local function changeValue()
		taps = taps + 1
		if taps == 1 then
			answerText.text = "Answer: " .. answer
		elseif taps == 2 then
			fnum, snum = getRand()
			getOperator()

			textNumOne.text = fnum
			textNumTwo.text = snum
			operatorText.text = operator
			answerText.text = ""
			taps = 0
		end
	end

	getOperator()

	background = display.newImage("images/mmbackground.png", 0, 0)

	textNumOne = display.newText(fnum, _W/2 - 30, _H/2, "Comic Sans MS", 30)
	textNumOne:setFillColor(1, 1, 1)

	operatorText = display.newText(operator, _W/2 + 15, _H/2, "Comic Sans MS", 30)
	operatorText:setFillColor(1, 1, 1)

	textNumTwo = display.newText(snum, _W/2 + 60, _H/2, "Comic Sans MS", 30)
	textNumTwo:setFillColor(1, 1, 1)

	answerText = display.newText("", _W/2, _H/2+30, "Comic Sans MS", 30)
	answerText:setFillColor(1, 1, 1) 

	background:addEventListener("tap", changeValue)

	Runtime:addEventListener("key", keyTouch)

	playGroup:insert(background)
	playGroup:insert(textNumOne)
	playGroup:insert(textNumTwo)
	playGroup:insert(operatorText)
	playGroup:insert(answerText)


	return class
end

return screen