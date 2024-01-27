-- declarar variaveis da tela

WINDOW_WIDTH   = 1200
WINDOW_HEIGHT  = 720
function love.load()
        love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT, {
            
        
            fullscreen = false,
            resizable = false,
            vsync = true,


        })

end

function love.update(dt)


end


function love.draw()
   love.graphics.printf("Hello Pong!", 0 ,WINDOW_HEIGHT / 2 - 10, WINDOW_WIDTH,"center" )

end