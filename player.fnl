(local animation (require :animation))
;;
;; player.fnl
;;
;; representation of a player "object"
;;
(fn init [start-tile asset mcooldown]
  "init a player table with default values

  params:
    - start-tile (number): x/y start coord
    - asset (str): relative path to asset file

  returns:
    - player table
"
  {:x start-tile
   :y start-tile
   :movedelta 0
   :movecooldown 0.15
   :last-move ""
   :should-animate false
   :animation (animation.init asset 16 16 .6)})

(fn update-loc [player movekey]
    (if (= movekey "up")
        (set player.y (- player.y 1)))
    (if (= movekey "down")
        (set player.y (+ player.y 1)))
    (if (= movekey "left")
        (set player.x (- player.x 1)))
    (if (= movekey "right")
        (set player.x (+ player.x 1))))

(fn update [player movekey actionkey dt]
    (animation.update player.animation player.should-animate dt)
    (set player.movedelta (+ player.movedelta dt))
    (set player.last-move movekey)
    (if (>= player.movedelta player.movecooldown)
        (set player.movedelta (- player.movedelta player.movecooldown) )
        (set player.last-move ""))
    (if (= actionkey "space")
        (set player.should-animate true))
    (if (= actionkey "")
        (set player.should-animate false))
    (update-loc player player.last-move))


(fn draw [player tile-width tile-height]
  "draw the player sprite at its coords

  params:
    - player (table): player table
    - tile-width (number): width of tiles
    - tile-height (number): height of tiles
"
  (animation.draw player.animation
                  (* player.x tile-width) 
                  (* player.y tile-height)))

{:init init
 :draw draw
 :update update}
