(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(local playerf (require "player"))
(local map (require "map"))
(local tile (require "tile"))

(fn love.load [args]
  (when (~= :web (. args 1)) (repl.start))
  (love.graphics.setDefaultFilter "nearest")
  (love.graphics.scale 2 2))

(fn love.keypressed [key]
    (local x (. _G.player "x"))
    (local y (. _G.player "y"))
    (if (= key "left")
      (tset _G.player "x" (- x 1)))
    (if (= key "right")
      (tset _G.player "x" (+ x 1)))
    (if (= key "up")
      (tset _G.player "y" (- y 1)))
    (if (= key "down")
      (tset _G.player "y" (+ y 1))))

(fn love.draw []
  (love.graphics.push)
  (love.graphics.scale 2 2)  
  (_G.drawmap _G.tileset _G.grass_quads _G.twidth _G.theight)
  (_G.drawplayer _G.player)
  (love.graphics.pop)
)
