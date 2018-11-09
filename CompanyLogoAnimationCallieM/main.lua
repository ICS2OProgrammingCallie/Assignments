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
local logo = display.newImageRect("Images/CompanyLogo.png", 0, 0)
logo.width = display.contentWidth/2
logo.height = display.contentHeight/2
logo.x = display.contentCenterX/.5
logo.y = display.contentCenterY/1
