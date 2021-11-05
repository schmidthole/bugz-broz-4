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
  (when (~= :web (. args 1)) (repl.start))
  (love.graphics.setDefaultFilter "nearest")

(fn love.keypressed [key]
    (local x (. player x))
    (local y (. player y))
    (if (= key "left")
      (if (is_tile_walkable (- x 1) y)
        (tset player x (- x 1))))
    (if (= key "right")
      (if (is_tile_walkable (+ x 1) y)
        (tset player x (+ x 1))))
    (if (= key "up")
      (if (is_tile_walkable x (- y 1))
        (tset player y (- y 1))))
    (if (= key "down")
      (if (is_tile_walkable x (+ y 1))
        (tset player y (+ y 1)))))


(fn love.update [dt]
  (each [key func (pairs keymap)]
    (if (love.keyboard.isDown key)
      (handle_keypress key)
    )
  )
)

(fn love.draw []
  (love.graphics.print "Max" x_spot y_spot))
