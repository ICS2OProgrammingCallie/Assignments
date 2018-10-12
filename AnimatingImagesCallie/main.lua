-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays three images the move around the screen
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background image
local backgroundImage = display.newImageRect("Images/Rainbow.JPG", 2048, 1536)

-- character image with width and height
local unicorn = display.newImageRect("Images/unicorn.png", 200, 200) 
local pegasus = display.newImageRect("Images/peg.png", 200, 200)
local earthPony = display.newImageRect("Images/e.png", 200, 200)

-- set initial x and y positions
pegasus.y = display.contentHeight/9
pegasus.x = 0
unicorn.y = display.contentHeight/2
unicorn.x = 0
earthPony.x = 500
earthPony.y = display.contentHeight/9

-- Function: ScalePegasus
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function makes the pegasus grow
local function ScalePegasus(event)
	-- make the image grow
	pegasus:scale(1.01,1.01)
end

-- ScalePegasus will be called over and over again
Runtime:addEventListener("enterFrame", ScalePegasus)

-- the pegasus will move
transition.to(pegasus, {x=2048, y=768, time=4000})

-- the unicorn will move and rotate
transition.to( unicorn, { rotation = unicorn.rotation-360, time=4000, onComplete=spinImage})
transition.to(unicorn, {x=1024, y=384, time=4000})

-- global variables
scrollSpeedPony = 2

-- set earthPony to be transperent
earthPony.alpha = 0

-- Function: MovePony
-- Input: this function excepts a event listener
-- Output: None
-- Description: This function changes the transperency of the pony so it fades in
local function MovePony(event)
	-- adds the scroll speed to the y-value of the pony
	earthPony.y = earthPony.y + scrollSpeedPony
	-- change the transperency of the pony every time it moves so that it fades in
	earthPony.alpha = earthPony.alpha + 0.01
end
	
-- MovePony will be called over and over again
Runtime:addEventListener("enterFrame", MovePony)

-- display text on the screen
local textObject = display.newText( "By: Callie", 500, 400, nil, 85)

-- Change the colour of the text
textObject:setTextColor(175/255, 60/255, 180/255)

-- set earthPony to be transperent
textObject.alpha = 0

-- Function: MoveText
-- Input: this function excepts a event listener
-- Output: None
-- Description: This function changes the transperency of the pony so it fades in
local function MoveText(event)
	-- change the transperency of the text every time it moves so that it fades in
	textObject.alpha = textObject.alpha + 0.01
end

-- MoveText will be called over and over again
Runtime:addEventListener("enterFrame", MoveText)