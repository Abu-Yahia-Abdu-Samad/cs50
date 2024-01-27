-- https://github.com/Ulydev/push
push = require "push"   -- chamamos a biblioteca

-- declarar variaveis da tela

WINDOW_WIDTH   = 1200
WINDOW_HEIGHT  = 720
VIRTUAL_WIDTH  = 432
VIRTUAL_HEIGHT = 243

function love.load()
      -- mudamso o filtro
    love.graphics.setDefaultFilter('nearest', 'nearest')
       
        push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable  = false,
            vsync      = true
             
        })

end

-- função de comandos
function love.keypressed(key)
    if key == "escape" then
     love.event.quit()
    end

end
function love.update(dt)


end


function love.draw()
    push:apply("start")
   love.graphics.printf("Hello Pong!", 0 ,VIRTUAL_HEIGHT / 2 - 10, VIRTUAL_WIDTH,"center" )
   push:apply("end")
end