-- Map Guess

mouseX = 0
mouseY = 0
mouseXclick = 0
mouseYclick = 0
text = "Fer"
mainFont = love.graphics.newFont(20)
textObject = love.graphics.newText( mainFont, "Fer Object" )
textMouseCoords = ""

function love.load(arg)
    --

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
        mouseXclick = love.mouse.getX() 
        mouseYclick = love.mouse.getY() 
    end

    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    textMouseCoords = mouseX .. " " .. mouseY
    textMouseClick = "Last click: " .. mouseXclick .. " " .. mouseYclick


end

function love.draw(dt)    

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(mainFont)
    love.graphics.print(text, 100, 200)
    love.graphics.setColor(0, 255, 255, 255)
    love.graphics.print(textMouseCoords, 200, 200)
    love.graphics.setColor(255, 0, 255, 255)
    love.graphics.print(textMouseClick, 200, 300)

    
end
