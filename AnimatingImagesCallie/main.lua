-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays three images the move around the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- global variables
scrollSpeed = 1

-- background image with width and height
local backgroundImage = display.newImageRect("Images/Rainbow.JPG", 2048, 1536)

-- character image with width and height
local unicorn = display.newImageRect("Images/unicorn.png", 200, 200) 
local pegasus = display.newImageRect("Images/pegasus.png", 200, 200)
local earthPony = display.newImageRect("Images/earthPony.png", 200, 200)

-- set initial x and y positions
pegasus.y = display.contentHeight/9
unicorn.x = 0
unicorn.y = display.contentHeight/2
unicorn.x = 0
earthPony.y = display.contentHeight/1
earthPony.x = 0

-- Function: MovePegasus
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function
local function MovePegasus(event)
	-- add the scroll speed to the x value of the pegasus
	pegasus.x = pegasus.x + scrollSpeed
	-- make the pegasus spin
	pegasus.x = pegasus.x + pegasus.y + 0.01
end

--MovePegasus will be called over and over again
Runtime:addEventListener("enterFrame", MovePegasus)

-- Function: MovePegasus
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function
local function MovePegasus(event)
	-- add the scroll speed to the x value of the pegasus
	pegasus.x = pegasus.x + scrollSpeed
	-- make the pegasus spin
	pegasus.x = pegasus.x + pegasus.y + 0.01
end