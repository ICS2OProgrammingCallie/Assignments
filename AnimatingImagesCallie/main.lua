-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays three images the move around the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- background image with width and height
local backgroundImage = display.newImageRect("Images/Rainbow.JPG", 2048, 1536)

-- character image with width and height
local unicorn = display.newImageRect("Images/unicorn.png", 200, 200) 
local pegasus = display.newImageRect("Images/pegasus.png", 200, 200)
local earthPony = display.newImageRect("Images/earthPony.png", 200, 200)

-- set initial x and y positions
pegasus.y = display.contentHeight/9
pegasus.x = 0
unicorn.y = display.contentHeight/2
unicorn.x = 0
earthPony.x = 500
earthPony.y = display.contentHeight/9

transition.to(pegasus, {x=2048, y=768, time=4000})

transition.to( unicorn, { rotation = unicorn.rotation-360, time=4000, onComplete=spinImage})
 
transition.to(unicorn, {x=1024, y=384, time=4000})

-- global variables
scrollSpeedPony = 2

-- set earthPony to be transperent
earthPony.alpha = 0

-- Function: MovePony
-- Input: this function adds the scroll speed to the y-value of the pony
local function MovePony(event)
	-- adds the scroll speed to the y-value of the pony
	earthPony.y = earthPony.y + scrollSpeedPony
	-- chaneg the transperency of the pony every time it moves so that it fades out
	earthPony.alpha = earthPony.alpha + 0.01
end

-- MovePony will be called over and over again
Runtime:addEventListener("enterFrame", MovePony)