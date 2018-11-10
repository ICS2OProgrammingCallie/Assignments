-----------------------------------------------------------------------------------------
-- Title: Jumping Animations Company Logo
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays the company logo on the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 50/255, 155/255, 200/255)

-- display the logo
local logo = display.newImageRect("Images/CompanyLogo.png", 500, 500)
logo.x = 0
logo.y = display.contentHeight/2

-- set the logo to be invisible
logo.isVisible = false

local function MoveLogo()

	logo.isVisible = true
	-- the logo will move and rotate the the center of the screen
	transition.to( logo, { rotation = logo.rotation-360, time=4000, onComplete=spinImage})
	transition.to( logo, {x=512, y=384, time=3000})
end

MoveLogo()

-- display the company name
local companyName1 = display.newText( " Jumping ", 1000, 500, nil, 70 )
local companyName2 = display.newText( " Animations ", 1000, 600, nil, 70 )
-- set the colour of the text
companyName1:setTextColor(44/255, 55/255, 167/255)
companyName2:setTextColor(44/255, 55/255, 167/255)

local function MoveText()

	--logo.isVisible = true
	-- the logo will move and rotate the the center of the screen
	transition.to( companyName1, { rotation = companyName1.rotation-360, time=4000, onComplete=spinImage})
	transition.to( companyName1, {x=700, y=500, time=3000})
	transition.to( companyName2, { rotation = companyName2.rotation-360, time=4000, onComplete=spinImage})
	transition.to( companyName2, {x=700, y=600, time=3000})
end

MoveText()