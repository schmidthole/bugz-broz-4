;;
;; tile.fnl
;;
;; tile definitions and related functions
;;
(local tile-dim 16)

(fn init [file x y dim props]
  {:props props
   :x x
   :y y
   :img (love.graphics.newImage file)
   :quad (love.graphics.newQuad x
                                y
                                dim
                                dim
                                dim
                                dim)})

(fn init-grass-bright [x y]
  (let [props {:collidable false
               :state "normal"}]
    (init "assets/grass-bright.png" x y tile-dim props)))

(fn init-barrel [x y]
  (let [props {:collidable true
               :state "normal"}]
    (init "assets/barrel.png" x y tile-dim props)))

(local lookup {:gb init-grass-bright
               :ba init-barrel})

{:lookup lookup}
