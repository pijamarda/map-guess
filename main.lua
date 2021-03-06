-- Map Guess




mouseX = 0
mouseY = 0
mouseXclick = 0
mouseYclick = 0
mouseXlastClick = 0
mouseYlastClick = 0
distance = 0
text = "Data: "
mainFont = love.graphics.newFont(20)
textObject = love.graphics.newText( mainFont, "Fer Object" )
textMouseCoords = ""

image = ""

gameState = 0

clickState = 0

-- testing PUSH

push = require "push"


--

function love.load(arg)
    --
    image = love.graphics.newImage( 'assets/img/mapa.jpg' )
    local x = image:getWidth()
    local y = image:getHeight()
    --love.window.setMode(x, y, {resizable=false, vsync=false})
    local gameWidth, gameHeight = x, y --fixed game resolution
    local windowWidth, windowHeight = love.window.getDesktopDimensions()
    windowWidth, windowHeight = windowWidth*.7, windowHeight*.7 --make the window a bit smaller than the screen itself

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})
    --
    mouseXclick = x / 2
    mouseYclick = y / 2
    mouseXlastClick = x / 2
    mouseYlastClick = y / 2

end

function love.update(dt)
    

    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end        

    if love.keyboard.isDown('left', 'a') then
        --
    elseif love.keyboard.isDown('right', 'd') then
        -- 
    elseif love.keyboard.isDown('up', 'w') then
        --
    elseif love.keyboard.isDown('down', 's') then
        --
    end
    

    if love.mouse.isDown(1) then
        local mX, mY = love.mouse.getPosition()
        mX, mY = push:toGame(mX, mY)
        if mX and mY then
            mouseXlastClick = mouseXclick
            mouseYlastClick = mouseYclick    
        end    
    end

    local mX, mY = love.mouse.getPosition()
    mX, mY = push:toGame(mX, mY)
    if mX and mY then
        mouseX, mouseY = mX, mY
    end
    
    if mouseX and mouseY then
        textMouseCoords = "Coords: " .. mouseX .. " " .. mouseY
    end
    if mouseXclick and mouseYclick then
        textMouseClick = "Actual click: " .. mouseXclick .. " " .. mouseYclick
    end
    textMouseLastClick = "Last click: " .. mouseXlastClick .. " " .. mouseYlastClick

end


function love.mousereleased(x, y, button, istouch)
    if button == 1 then 
        local mX, mY = love.mouse.getPosition()
        mX, mY = push:toGame(mX, mY)
        if mX and mY then
            mouseXclick, mouseYclick = mX, mY
            local x = mouseXlastClick - mouseXclick
            local y = mouseYlastClick - mouseYclick
            local x2y2 = x*x + y*y
            distance = "Distance: " .. round(math.sqrt(x2y2), 3)
        end
    end    
end


function love.draw(dt)    
    push:apply("start")
        love.graphics.draw(image, 0, 0)
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.setFont(mainFont)
        love.graphics.print(text, 10, 20)    
        love.graphics.print(textMouseCoords, 10, 40)    
        love.graphics.print(textMouseClick, 10, 60)    
        love.graphics.print(textMouseLastClick, 10, 80)
        love.graphics.setColor(0, 0, 0, 255)
        love.graphics.line(mouseXlastClick, mouseYlastClick, mouseXclick, mouseYclick)
        love.graphics.print(distance, 10, 100)
        love.graphics.setColor(255, 255, 255, 255)
    push:apply("end")    
end


function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
