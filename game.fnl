(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(local player (require :player))
(local map (require :map))
(local tile (require :tile))

;; game configuration
(local config {:player1-start-tile 2
               :player1-asset "assets/player.png"})

;; player1 table
(var player1 (player.init
              config.player1-start-tile
              config.player1-asset))

(fn love.load [args]
  ;; startup that juicy repl so we can jack in
  (when (~= :web (. args 1)) (repl.start))
  ;; get them graphics setup for pixelated retroness and scale
  (love.graphics.setDefaultFilter "nearest")
  (love.graphics.scale 2 2))

(fn love.keypressed [key]
  (if (= key "left")
      (set player1.x (- player1.x 1)))

  (if (= key "right")
      (set player1.x (+ player1.x 1)))

  (if (= key "up")
      (set player1.y (- player1.y 1)))

  (if (= key "down")
      (set player1.y (+ player1.y 1))))

(fn love.draw []
  (love.graphics.push)
  (love.graphics.scale 2 2)
  (_G.drawmap _G.tileset _G.grass_quads _G.twidth _G.theight)
  (player.draw player1 _G.twidth _G.theight)
  (love.graphics.pop)
  )
