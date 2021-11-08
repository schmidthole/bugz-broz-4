;;
;; animation.fnl
;;
;; handles sprite animations
;;
(fn init [asset width height duration]
    (local image (love.graphics.newImage asset))
    (local quads {})
    (for [x 0 (- (image:getWidth) width) width]
        (table.insert quads (love.graphics.newQuad x 0 width height (image:getDimensions))))
    {:width width
     :height height
     :duration duration
     :quads quads
     :img image
     :ct 0
     :started false
     :last-sprite-num 1})

(fn update [animation should-animate dt]
    (if (= should-animate true)
        (if (= animation.started false)
            (set animation.started true)))
        
    (if (= animation.started true)
        (set animation.ct (+ animation.ct dt))
        (set animation.ct 0))
    (if (>= animation.ct animation.duration)
        (set animation.ct (- animation.ct animation.duration)))
    animation)

(fn draw [animation x y]
    (var spriteNum (math.floor (+ (* (/ animation.ct animation.duration) (length animation.quads)) 1)) )
    (if (= animation.last-sprite-num (length animation.quads))
        (if (= spriteNum 1)
            (if (= animation.started true)
                (set animation.started false))))
    (set animation.last-sprite-num spriteNum)

    (love.graphics.draw animation.img 
                        (. animation.quads spriteNum)
                        x
                        y))

{:init init
 :update update
 :draw draw}

