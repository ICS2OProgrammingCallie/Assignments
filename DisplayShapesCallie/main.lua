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
local verticesCompass = {0,200, 50,75, 100,100, 75,50, 200,0, 75,-50, 100,-100, 50,-75, 0,-200, -50,-75, -100,-100, -75,-50, -200,0, -75,50, -100,100, -50,75, }
local triangle = display.newPolygon( 500, 175, verticesTriangle )
local hexagon = display.newPolygon( 800, 200, verticesHexagon )
local diamond = display.newPolygon( 200,400, verticesDiamond )
local compass = display.newPolygon( 600,500, verticesCompass)
local textObjectTri
local textObjectHex
local textObjectDiamond
local textObjectCompass
local textObjectN 
local textObjectS
local textObjectE 
local textObjectW

-- set the width of triangle border
triangle.strokeWidth = 15

-- set the colour of the triangle
triangle:setFillColor(0.7, 0.1, 0.3)

-- set the colour of the triangle's border
triangle:setStrokeColor(4, 0, 7)

-- set the width of hexagon's border
hexagon.strokeWidth = 5

-- set the colour of the hexagon
hexagon:setFillColor(0.3, 0.1, 0.8)

-- set the colour of the hexagon's border
hexagon:setStrokeColor(0.8, 0.0, 0.8)

-- set the width of diamond's border
diamond.strokeWidth = 20

-- set the colour of the diamond
diamond:setFillColor(0.1, 0.5, 0.3)

-- set the colour of the diamonds border
diamond:setStrokeColor(0, 5, 5)

-- display text on the screen saying shapes names
textObjectTri = display.newText( "Triangle", 420, 350, nil, 50)
textObjectHex = display.newText( "Hexagon", 800, 350, nil, 50)
textObjectDiamond = display.newText( "Diamond", 200, 600, nil, 50)
textObjectCompass = display.newText( "Compass", 600, 500, nil, 50)
textObjectN = display.newText( "North", 600, 280, nil, 50)
textObjectE = display.newText( "East", 850, 500, nil, 50)
textObjectS = display.newText( "South", 600, 720, nil, 50)
textObjectW = display.newText( "West", 340, 500, nil, 50)


-- set the colour of the text
textObjectTri:setTextColor(200/255, 50/255, 80/255)
textObjectHex:setTextColor(50/255, 70/255, 150/255)
textObjectDiamond:setTextColor(45/255, 200/255, 100/255)
textObjectCompass:setTextColor(255/255, 0/255, 0/255)
textObjectW:setTextColor(1, 1, 1)
textObjectS:setTextColor(1, 1, 1)
textObjectN:setTextColor(1, 1, 1)
textObjectE:setTextColor(1, 1, 1)

--set the colour of compass
local gradient = {
    type="gradient",
    color1={ 3, 2, 5 }, 
    color2={ 0.9, 0.5, 0.5 }, 
    direction="down"
}

compass:setFillColor(gradient)

-- create my local varibales
local areaText
local baseOfTriangle = 427
local heightOfTriangle = 516
local areaOfTriangle
local textSize = 30

-- calculate the area of the triangle
areaOfTriangle = baseOfTriangle * heightOfTriangle / 2

-- write the area on the screen
areaText = display.newText("The area of this traingle with a base of \n" ..
	baseOfTriangle .. " and a height of " .. heightOfTriangle .. " is " ..
	areaOfTriangle .. " pixel².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 10
areaText.y = display.contentHeight/8