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
    -- torcando a fonte dio game
    -- var small gaurdou a fonte
    smallFont = love.graphics.newFont('font.ttf', 8)
     -- essa função chama a fonte e passamos a variavel
    love.graphics.setFont(smallFont) 
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
    -- chamamos a biblioteca pra desenhar aqui
    push:apply("start")
    -- pintamos a tela com as cores do gamne antigo
    --[[ Argumentos da função clear
 R
O canal vermelho da cor para limpar a tela.
 g
O canal verde da cor para limpar a tela.
 b
O canal azul da cor para limpar a tela.
número a (1)
O canal alfa da cor para limpar a tela.]]
    love.graphics.clear(40/255, 45/255, 52/255, 255/255) -- vermelho 45, verde 45,azul 53 e o alpha branco
    
   love.graphics.printf("Hello Pong!", 0 ,VIRTUAL_HEIGHT / 2 - 10, VIRTUAL_WIDTH,"center" )

    -- desenhando  o player esquerdo
    -- função que desenha um retangulo
    --[[

     Argumentos
Como desenhar o retângulo.
 o fill refere-se a cor completa
 tem a line tbm que so faz o contorno
 x
A posição do canto superior esquerdo ao longo do eixo x.
 y
A posição do canto superior esquerdo ao longo do eixo y.
 largura do retangulo
A largura do retângulo.
 altura do retangulo
A altura do retângulo.
    ]]
    love.graphics.rectangle('fill', 10, 30, 5, 20)

     -- player direito
     love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

     -- esse é a bola (eu quero criar um circulo depois)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 + 6, 4, 4)


   push:apply("end")
end