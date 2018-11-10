-----------------------------------------------------------------------------------------
-- Title: Jumping Animations Company Logo
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays the company logo on the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour

--
local logo = display.newImageRect("Images/CompanyLogo.png", 500, 500)
logo.x = display.contentWidth/2
logo.y = display.contentHeight/2

-- the unicorn will move and rotate
transition.to( logo, { rotation = logo.rotation-360, time=4000, onComplete=spinImage})
transition.to( logo, {x=1024, y=384, time=4000})