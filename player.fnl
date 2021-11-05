(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(local start_tile 2)
(fn init_player []
    (let [p_obj {
            "x"     start_tile
            "y"     start_tile
            "img"   (love.graphics.newImage "assets/player.png")
        }
      ]
    p_obj)
)

(global player (init_player))