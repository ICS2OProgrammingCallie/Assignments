-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays three images the move around the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect ("Images/Rainbow.JPG", 2048, 1536)
