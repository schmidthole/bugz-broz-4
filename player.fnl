(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(local tile (require "tile"))

(local start_tile 2)
(fn init_player []
    (let [p_obj {
            "x"     start_tile
            "y"     start_tile
            "img"   (love.graphics.newImage "assets/player.png")
        }] p_obj))

(fn drawp [p]
    ;(love.graphics.push)
    ;(love.graphics.scale 2 2)   
    (love.graphics.draw (. p "img") (* (. p "x") _G.twidth) (* (. p "y") _G.theight))
    ;(love.graphics.pop)
)

(global drawplayer drawp)
(global player (init_player))