(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))

(fn load_tileset [file ncoltiles nrowtiles]
    (global tileset (love.graphics.newImage file))
    (global twidth (/ (tileset:getWidth) nrowtiles))
    (global theight (/ (tileset:getHeight) ncoltiles))
    (let [quads {} ] 
        (for [i 0 (- nrowtiles 1)]
            (for [j 0 (- ncoltiles 1)]
                (table.insert quads
                    (love.graphics.newQuad 
                        (* j (+ twidth))
                        (* i (+ theight))
                        twidth
                        theight
                        (tileset:getWidth)
                        (tileset:getHeight)))))
    quads))
        
(global grass_quads (load_tileset "assets/grass.png" 4 5))


