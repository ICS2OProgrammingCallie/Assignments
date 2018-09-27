--------------------------------------------------------------------------------------------------
-- Title: Display shapes
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays shapes and has their names under them
--------------------------------------------------------------------------------------------------

-- create my local variable
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5
 
local vertices = { }
 
local o = display.newPolygon( halfW, halfH, vertices )
o.fill = { type="image", filename="mountains.png" }
o.strokeWidth = 10
o:setStrokeColor( 1, 5, 0 )

