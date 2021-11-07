;;
;; map.fnl
;;
;; game map representation
;;
(var seed [["gb", "gb", "gb", "gb", "gb", "gb", "gb"]
           ["gb", "gb", "gb", "gb", "gb", "gb", "gb"]
           ["gb", "gb", "gb", "gb", "gb", "ba", "gb"]
           ["gb", "gb", "gb", "gb", "gb", "gb", "gb"]
           ["gb", "ba", "gb", "gb", "gb", "gb", "gb"]
           ["gb", "gb", "gb", "gb", "gb", "gb", "gb"]
           ["gb", "gb", "gb", "ba", "gb", "gb", "gb"]
           ["gb", "gb", "gb", "gb", "gb", "gb", "gb"]])

(fn init [seed tile-lookup]
  (let [map []]
    (each [i row (ipairs seed)]
      (let [tile-row []]
        (each [j id (ipairs row)]
          tile-looy)
        (table.insert map tile-row)))))

(fn draw [tileset]
  (each [i row (ipairs tilemap)]
    (each [j tile (ipairs row)]
      (if (~= tile 0)
          (love.graphics.draw tileset.image
                              (. tileset.quads tile)
                              (* j tileset.width)
                              (* i tileset.height))))))

{:draw draw}
