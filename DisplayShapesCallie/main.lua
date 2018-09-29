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
local verticesHexagon = {-100,100, 100,100, 100,-25, 0,-150, -100,-25, }
local verticesDiamond = {100,0, 0,125, -100,0, 0,-125, }
local verticesMyShape = {0,200, 50,75, 100,100, 75,50, 200,0, 75,-50, 100,-100, 50,-75, 0,-200, -50,-75, -100,-100, -75,-50, -200,0, -75,50, -100,100, -50,75, }
local triangle = display.newPolygon( 500, 175, verticesTriangle )
local hexagon = display.newPolygon( 800, 200, verticesHexagon )
local diamond = display.newPolygon( 200,400, verticesDiamond )
local myShape = display.newPolygon( 600,500, verticesMyShape)
local textObjectTri
local textObjectHex
local textObjectDiamond
local textObjectMyShape

-- set the width of traingle border
triangle.strokeWidth = 15

-- set the colour of the triangle
triangle:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the triangles border
triangle:setStrokeColor(4, 0, 7)

-- set the width of hexagons border
hexagon.strokeWidth = 5

-- set the colour of the hexagon
hexagon:setFillColor(0.3, 0.1, 0.8)

-- set the colour of the hexagons border
hexagon:setStrokeColor(0.8, 0.0, 0.8)

-- set the width of diamond border
diamond.strokeWidth = 20

-- set the colour of the diamond
diamond:setFillColor(0.1, 0.5, 0.3)

-- set the colour of the diamonds border
diamond:setStrokeColor(0, 5, 5)

-- display text on the screen saying shapes names
textObjectTri = display.newText( "Triangle", 420, 350, nil, 50)
textObjectHex = display.newText( "Hexagon", 800, 400, nil, 50)
textObjectDiamond = display.newText( "Diamond", 200, 600, nil, 50)
textObjectMyShape = display.newText( "My Shape", 600, 720, nil, 50)


-- set the colour of the text
textObjectTri:setTextColor(200/255, 50/255, 80/255)
textObjectHex:setTextColor(50/255, 70/255, 150/255)
textObjectDiamond:setTextColor(45/255, 200/255, 100/255)
textObjectMyShape:setTextColor(255/255, 0/255, 0/255)

--set the colour of my shape
local gradient = {
    type="gradient",
    color1={ 3, 2, 5 }, 
    color2={ 0.9, 0.5, 0.5 }, 
    direction="down"
}

myShape:setFillColor(gradient)