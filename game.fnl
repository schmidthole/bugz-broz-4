(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(var prompt "none")
(var keymap {
             :up (fn [] (set prompt "up"))
             :down (fn [] (set prompt "down"))
             :left (fn [] (set prompt "left"))
             :right (fn [] (set prompt "right"))
             })
(var width 1000)
(var height 750)
(var x_spot 500)
(var y_spot 375)
(var speed 2.5)

(fn love.load [args]
  (when (~= :web (. args 1)) (repl.start)))

(fn handle_keypress [key]
  (if (= "down" key)
    (set y_spot (+ y_spot speed))
      (= "up" key)
    (set y_spot (- y_spot speed))
      (= "right" key)
    (set x_spot (+ x_spot speed))
      (= "left" key)
    (set x_spot (- x_spot speed))
  )
)


(fn love.update [dt]
  (each [key func (pairs keymap)]
    (if (love.keyboard.isDown key)
      (handle_keypress key)
    )
  )
)

(fn love.draw []
  (love.graphics.print "bug World" x_spot y_spot))
