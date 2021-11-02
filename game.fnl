(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(var prompt "none")
(var keymap {
             :up (fn [] (set prompt "up"))
             :down (fn [] (set prompt "down"))
             :left (fn [] (set prompt "left"))
             :right (fn [] (set prompt "right"))
             })

(fn love.load [args]
  (when (~= :web (. args 1)) (repl.start)))

(fn love.update [dt]
  (each [key func (pairs keymap)]
    (if (love.keyboard.isDown key)
        (func []))))

(fn love.draw []
  (love.graphics.print "BUGZ World" 400 300))
