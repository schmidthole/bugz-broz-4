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
(local down_name "down")
(local up_name "up")
(local left_name "left")
(local right_name "right")

(fn love.load [args]
  (when (~= :web (. args 1)) (repl.start)))

(fn love.update [dt]
  (each [key func (pairs keymap)]
    (if (love.keyboard.isDown key)
      (if (= down_name key)
        (set y_spot (+ y_spot speed))
          (= up_name key)
        (set y_spot (- y_spot speed))
          (= right_name key)
        (set x_spot (+ x_spot speed))
          (= left_name key)
        (set x_spot (- x_spot speed))
      )
    )
  )
)

(fn love.draw []
  (love.graphics.print "bug World" x_spot y_spot))
