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

function love.load(arg)
    --
    image = love.graphics.newImage( 'assets/img/mapa.jpg' )
    local x = image:getWidth()
    local y = image:getHeight()
    love.window.setMode(x, y, {resizable=false, vsync=false})
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
        mouseXlastClick = mouseXclick
        mouseYlastClick = mouseYclick
        
         
    end

    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    textMouseCoords = "Coords: " .. mouseX .. " " .. mouseY
    textMouseClick = "Actual click: " .. mouseXclick .. " " .. mouseYclick
    textMouseLastClick = "Last click: " .. mouseXlastClick .. " " .. mouseYlastClick

end


function love.mousereleased(x, y, button, istouch)
    if button == 1 then 
        mouseXclick = love.mouse.getX() 
        mouseYclick = love.mouse.getY()
    end
    ----
    local x = mouseXlastClick - mouseXclick
    local y = mouseYlastClick - mouseYclick
    local x2y2 = x*x + y*y
    distance = "Distance: " .. round(math.sqrt(x2y2), 3)
    round(10.33333, 2)
end


function love.draw(dt)    

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

    
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
