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

transition.to(pegasus, {x=2048, y=768, time=4000})

transition.to( unicorn, { rotation = unicorn.rotation-360, time=4000, onComplete=spinImage})
 
transition.to(unicorn, {x=1024, y=384, time=4000})

