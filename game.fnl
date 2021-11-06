(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(local player (require :player))
(local tile (require :tile))
(local map (require :map))

;; game configuration
(local config {:player1-start-tile 2
               :player1-asset "assets/player.png"
               :grass-asset "assets/grass.png"
               :grass-cols 4
               :grass-rows 5})

;; player1 table
(var player1 (player.init
              config.player1-start-tile
              config.player1-asset))

;; grass map tiles
(var grass-tileset (tile.load-tileset config.grass-asset
                                      config.grass-cols
                                      config.grass-rows))

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

  (map.draw grass-tileset)
  (player.draw player1 grass-tileset.width grass-tileset.height)

  (love.graphics.pop))
