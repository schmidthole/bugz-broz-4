;;
;; player.fnl
;;
;; representation of a player "object"
;;
(fn init [start-tile asset]
  "init a player table with default values

  params:
    - start-tile (number): x/y start coord
    - asset (str): relative path to asset file

  returns:
    - player table
"
  {:x start-tile
   :y start-tile
   :img (love.graphics.newImage asset)})

(fn draw [player tile-width tile-height]
  "draw the player sprite at its coords

  params:
    - player (table): player table
    - tile-width (number): width of tiles
    - tile-height (number): height of tiles
"
  (love.graphics.draw player.img
                      (* player.x tile-width)
                      (* player.y tile-height)))

{:init init
 :draw draw}
