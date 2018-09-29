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
local verticesHexagon = {-150,150, 150,150, 200,-50, 0,-250, -200,-50, }
local verticesDiamond = {100,0, 0,125, -100,0, 0,-125, }
local triangle = display.newPolygon( 500, 200, verticesTriangle )
local hexagon = display.newPolygon( 800, 400, verticesHexagon )
local diamond = display.newPolygon( 200,400, verticesDiamond )
local textObjectTri
local textObjectHex
local textObjectDiamond

-- set the width of traingle border
triangle.strokeWidth = 20

-- set the colour of the triangle
triangle:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the triangles border
triangle:setStrokeColor(4, 0, 7)

-- set the width of hexagons border
hexagon.strokeWidth = 20

-- set the colour of the hexagon
hexagon:setFillColor(0.3, 0.1, 0.8)

-- set the colour of the hexagons border
hexagon:setStrokeColor(9, 2, 4)

-- set the width of diamond border
diamond.strokeWidth = 20

-- set the colour of the diamond
diamond:setFillColor(0.1, 0.5, 0.3)

-- set the colour of the diamonds border
diamond:setStrokeColor(0, 5, 5)

-- display text on the screen saying shapes names
textObjectTri = display.newText( "Triangle", 420, 400, nil, 50)
textObjectHex = display.newText( "Hexagon", 800, 650, nil, 50)
textObjectDiamond = display.newText( "Diamond", 200, 600, nil, 50)

--set the colour of the text
textObjectTri:setTextColor(200/255, 50/255, 80/255)
textObjectHex:setTextColor(50/255, 70/255, 150/255)
textObjectDiamond:setTextColor(45/255, 200/255, 100/255)