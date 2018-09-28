--------------------------------------------------------------------------------------------------
-- Title: Display shapes
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays shapes and has their names under them
--------------------------------------------------------------------------------------------------

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Set the background colour of my screen
display.setDefault("background", 50/255, 155/255, 200/255)

-- create my local variable
local verticesTriangle = {-25,300, 100,0, 200,100, }
local verticesOctagon  = {-100,100, 100,100, 50,200, -50,200, 100,-100, -100,-100, -200,-50, 50,-200}
local triangle = display.newPolygon( 500, 200, verticesTriangle )
local octagon = display.newPolygon( 1111, 55, verticesOctagon )


-- set the width of traingle border
triangle.strokeWidth = 20

-- set the colour of the triangle
triangle:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the triangles border
triangle:setStrokeColor(4, 0, 7)

-- set the width of octagon
octagon.strokeWidth = 20

-- set the colour of the triangle
octagon:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the triangles border
octagon:setStrokeColor(5, 2, 8)

