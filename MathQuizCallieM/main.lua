-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays a math question and asks the user to answer in a certain amounty of time with three lives 
----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background image
local backgroundImage = display.newImageRect("Images/backgroundImage.jpg", 2048, 1536)
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local userAnswer
local correctAnswer
local incorrectAnswer

-- variables for math equations
local addition1
local addition2
local subtraction1
local subtraction2
local division1
local division2
local multiplication1
local multiplication2
--local factorial1
local exponent1
local exponent2
--local squareroot1
--local squareroot2

-- variables for number of correct answers
local numberOfCorrect = 0
local amountCorrect

-- variables for the timer and lives
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local lives = 4

-- Variables for the images
local heart1
local heart2
local heart3
local gameOver
----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------

local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3")
local incorrectSoundChannel
local gameOverSound= audio.loadSound( "Sounds/gameOverSound.WAV")
local gameOverSoundChannel

----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	addition1 = math.random(1, 20)
	addition2 = math.random(1, 20)
	subtraction1 = math.random(1, 20)
	subtraction2 = math.random(1, 20)
	division1 = math.random(1, 100)
	division2 = math.random(1, 100)
	multiplication1 = math.random(1, 10)
	multiplication2 = math.random(1, 10)
	--factorial1 = math.random(1, 100)
	exponent1 = math.random(1, 5)
	exponent2 = math.random(1, 5)
	randomOperator = math.random(1, 5)

	if ( randomOperator == 1) then


		correctAnswer = addition1 + addition2

		-- create question in text object
		questionObject.text = addition1 .. " + " .. addition2 .. " = "

	elseif ( randomOperator == 2) then

		
		correctAnswer = subtraction1 - subtraction2
		
		-- create question in text object
		questionObject.text = subtraction1  .. " - " .. subtraction2 .. " = "

	

	elseif (randomOperator == 3) then

		correctAnswer = division1 / division2
	
		--create question in text object
		questionObject.text = division1 .. " / " .. division2 .. " = "

	elseif ( randomOperator == 4) then
		correctAnswer = multiplication1 * multiplication2

		-- create question in text object
		questionObject.text = multiplication1 .. " * " .. multiplication2 .. " = "

	--elseif ( randomOperator == 5) then
		--correctAnswer = factorial1 "!"

		--questionObject.text = factorial1.. "!"

	elseif (randomOperator == 5) then

		correctAnswer = exponent1 ^ exponent2

		questionObject.text = exponent1 .. " ^ " .. exponent2 .. " = "
	
	end
end

local function UpdateHearts()

	-- make the hearts dissapear when you lose a life

	if (lives == 3) then

		heart3.isVisible = false

	elseif (lives == 2) then

		heart2.isVisible = false

	elseif (lives == 1) then

		-- when no lives left, game over image and sound will show
		heart1.isVisible = false
		gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
		gameOver.x = display.contentWidth * 1/2
		gameOver.y = display.contentHeight * 1/2
		NumericField.isVisible = false
		gameOverSoundChannel = audio.play(gameOverSound)

	end

	lives = lives -1

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "Time: ".. secondsLeft  

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		UpdateHearts()
		incorrectSoundChannel = audio.play(incorrectSound)
		secondsLeft = totalSeconds
		AskQuestion()
	end
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2100, HideCorrect)
			numberOfCorrect = numberOfCorrect + 1
			amountCorrect.text = "Number Correct = ".. numberOfCorrect
			secondsLeft = totalSeconds

		-- if the users answer and the incorrect answer are the same:
		else
			incorrectObject.isVisible = true
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2100, HideIncorrect)
			UpdateHearts()
			secondsLeft = totalSeconds
		end
	end
end

local function YouWin()

	if (amountCorrect == 5) then

		youWin = display.newImageRect("Images/youWin.png", display.contentWidth, display.contentHeight)
		youWin.x = display.contentWidth * 1/2
		youWin.y = display.contentHeight * 1/2
		NumericField.isVisible = false
	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- displays an object and sets the colour
questionObject = display.newText( "", display.contentWidth/2, display.contentHeight/2, nil, 75 )
questionObject:setTextColor(204/255, 153/255, 255/255)

-- create the correct text and make it invisible
correctObject = display.newText( "You Got it right!", display.contentWidth/2, display.contentHeight*2.5/3, nil, 75 )
correctObject:setTextColor(230/255, 51/255, 51/255)
correctObject.isVisible = false

-- create the incorrect text object make it invisible
incorrectObject = display.newText( "Incorrect, the correct answer is ", display.contentWidth/2, display.contentHeight*2.5/3, nil, 40)
incorrectObject:setTextColor(51/255, 123/255, 230/255)
incorrectObject.isVisible = false

-- Create numeric field
NumericField = native.newTextField( display.contentWidth/2, display.contentHeight/1.5, 200, 80)
NumericField.inputType = "display"

-- add the event listener for the numeric field
NumericField:addEventListener( "userInput", NumericFieldListener )

-- display text for correct answers
amountCorrect = display.newText( "Correct = ".. numberOfCorrect, display.contentWidth/3.5, display.contentHeight/5, nil, 50)
amountCorrect:setTextColor(63/255, 222/255, 253/255)

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 150, 150)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 150, 150)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 150, 150)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- display the timer on the screen
clockText = display.newText ("", display.contentWidth/3, display.contentHeight*1/3, nil, 75)
clockText:setTextColor(60/255, 4/255, 144/255)

----------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- call the function to remove hearts
UpdateHearts()

-- Call the timer
StartTimer()

YouWin()

