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

-- addition
local addition1
local addition2
-- subtraction
local subtraction1
local subtraction2
-- division
local division1
local division2
local temp
-- multiplication
local multiplication1
local multiplication2
-- exponents
local exponent1
local exponent2
local exponentObject
-- square roots
local squareRoot1
local sqrtObject

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
local youWin
----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------
-- variables for correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.WAV" )
local correctSoundChannel
-- variables for incorrect sound
local incorrectSound = audio.loadSound( "Sounds/wrongSound.WAV")
local incorrectSoundChannel
-- variables for game over sound
local gameOverSound = audio.loadSound( "Sounds/gameOverSound.WAV")
local gameOverSoundChannel
-- variables for the background music
local bkgMusic = audio.loadSound( "Sounds/bkgMusic.WAV")
local bkgMusicChannel

-- play the background music
bkgMusicChannel = audio.play(bkgMusic)


----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	-- random numbers for addition
	addition1 = math.random(1, 20)
	addition2 = math.random(1, 20)
	-- random numbers for subtraction
	subtraction1 = math.random(1, 20)
	subtraction2 = math.random(1, 20)
	-- random numbers for division
	division1 = math.random(1, 10)
	division2 = math.random(1, 10)
	-- random numbers for multiplication
	multiplication1 = math.random(1, 10)
	multiplication2 = math.random(1, 10)
	-- random numbers for exponents
	exponent1 = math.random(1, 5)
	exponent2 = math.random(1, 5)
	-- random numbers for square roots
	squareRoot1 = math.random(1, 100)
	-- random numbers for random operator
	randomOperator = math.random(1, 6)
	
	-- creating the operations
	if ( randomOperator == 1) then

		-- calculating the correct answer
		correctAnswer = addition1 + addition2

		--create question in text object
		questionObject.text = addition1 .. " + " .. addition2 .. " = "

	elseif ( randomOperator == 2) then

		-- making sure the first number is the greater number
		if ( subtraction1 > subtraction2 ) then

			-- calculating the correct answer
			correctAnswer = subtraction1 - subtraction2
		
			--create question in text object
			questionObject.text = subtraction1  .. " - " .. subtraction2 .. " = "

		else

			-- calculating the correct answer
			correctAnswer = subtraction2 - subtraction1
		
			-- create question in text object
			questionObject.text = subtraction2  .. " - " .. subtraction1 .. " = "
			

		end

	elseif (randomOperator == 3) then

		-- making sure the division has no decimals
		temp = division1 * division2
		-- calculating the correct answer
		correctAnswer = temp / division2

		questionObject.text = temp .. " / ".. division2 .. " = "


	elseif ( randomOperator == 4) then

		-- calculating the correct answer
		correctAnswer = multiplication1 * multiplication2

		-- create question in text object
		questionObject.text = multiplication1 .. " * " .. multiplication2 .. " = "



	elseif (randomOperator == 5) then

		-- adding the exponent function
		exponentObject = math.pow(exponent1, exponent2)
		-- calculating the correct answer
		correctAnswer = exponentObject
		-- create question in text object
		questionObject.text = exponent1.." ^ ".. exponent2 .. "="

	elseif (randomOperator == 6) then

		-- adding the square root function
		sqrtObject = math.sqrt(squareRoot1)
		-- calculating the correct answer
		correctAnswer = sqrtObject
		-- create question in text object
		questionObject.text = "Square root of " .. squareRoot1 .. " = "

    end
end

-- hiding the correct object
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end
-- hiding the incorrect object
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
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
		gameOverSoundChannel = audio.play(gameOverSound)
		-- hiding the numeric field
		numericField.isVisible = false
		-- canceling the timer
		timer.cancel ( countDownTimer )
		-- stop the bkg music
		audio.stop(bkgMusicChannel)

	end

	lives = lives -1

end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "Time: ".. secondsLeft  

	if (secondsLeft == 0 ) then
		-- updating lives
		UpdateHearts()
		-- play inccorect sound
		incorrectSoundChannel = audio.play(incorrectSound)
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		-- asking new quetsion
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
			-- play correct sound
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(1000, HideCorrect)
			audio.stop(bkgMusic)
			timer.performWithDelay(1000, audio.play)
		
			-- updating the score
			numberOfCorrect = numberOfCorrect + 1
			amountCorrect.text = "Number Correct = ".. numberOfCorrect
			-- updating time
			secondsLeft = totalSeconds
			event.target.text = ""

		
		-- if the users answer and the incorrect answer are the same:
		else
			-- playing incorrect sound
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2100, HideIncorrect)
			-- updating lives
			UpdateHearts()
			-- updating time
			secondsLeft = totalSeconds
			-- saying the correct answer
			incorrectObject = display.newText( "Incorrect, the correct answer is ".. correctAnswer, display.contentWidth/2, display.contentHeight*2.5/3, nil, 40)
			incorrectObject:setTextColor(27/255, 34/255, 243/255)
			event.target.text = ""
		end
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
correctObject:setTextColor(27/255, 34/255, 243/255)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/1.5, 200, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display text for correct answers
amountCorrect = display.newText( "Number correct = ".. numberOfCorrect, display.contentWidth/3.5, display.contentHeight/5, nil, 50)
amountCorrect:setTextColor(186/255, 49/255, 49/255)

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


