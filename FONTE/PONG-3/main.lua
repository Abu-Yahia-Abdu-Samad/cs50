-- https://github.com/Ulydev/push
push = require "push"   -- chamamos a biblioteca

-- declarar variaveis da tela

WINDOW_WIDTH   = 1200
WINDOW_HEIGHT  = 720

VIRTUAL_WIDTH  = 432
VIRTUAL_HEIGHT = 243


-- VARIAVEL VEL DOS PLAYERS
PADDLE_SPEED = 200


function love.load()
      -- mudamso o filtro
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- torcando a fonte dio game
    -- var small gaurdou a fonte
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- fonte grande para o placar
    placarFont = love.graphics.newFont('font.ttf', 32) -- chamar no draw


     -- essa função chama a fonte e passamos a variavel
    love.graphics.setFont(smallFont) 
        push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable  = false,
            vsync      = true
             
        })
        
        -- load var do placar
        player1Score = 0
        player2Score = 0

        --pos dos player no eixo Y de inicio
        player1_y = 30
        player2_y = VIRTUAL_HEIGHT/2


end

-- função de comandos
function love.keypressed(key)
    if key == "escape" then
     love.event.quit()
    end

end


function love.update(dt)
 -- MOVIMENTO DO PLAYER 1

   if love.keyboard.isDown("w") then 
    --[[
     se eu apertei o W o Y do player 1 diminue cada frame 
        e o delta time controla o tamanho do frame
    ]]
      player1_y = player1_y + -PADDLE_SPEED *dt
    elseif love.keyboard.isDown("s") then

      player1_y = player1_y + PADDLE_SPEED *dt

    end
     -- MOVIMENTO DO PLAYER 2

   if love.keyboard.isDown("up") then 
    --[[
     se eu apertei o W o Y do player 1 diminue cada frame 
        e o delta time controla o tamanho do frame
    ]]
      player2_y = player2_y + -PADDLE_SPEED *dt
    elseif love.keyboard.isDown("down") then

      player2_y = player2_y + PADDLE_SPEED *dt

    end
         
 

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

  -- placar
        
   love.graphics.setFont(placarFont) -- fonte
   -- desenhou na tela o placar P'
   love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH /2 -50, VIRTUAL_HEIGHT / 3)
   love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH /2 + 30, VIRTUAL_HEIGHT / 3)
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
    love.graphics.rectangle('fill', 10, player1_y, 5, 20)

     -- player direito
     -- var playery no eixo Y pra movero player
     love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2_y, 5, 20)

     -- esse é a bola (eu quero criar um circulo depois)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 8, VIRTUAL_HEIGHT / 2 - 2, 4, 4)


   push:apply("end")
end