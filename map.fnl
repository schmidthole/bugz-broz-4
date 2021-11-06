(local tile (require "tile"))

(global tilemap [
    [0 1 2 4 5 6 7 8 9 10 11 12 13 14 15 5 5 5 5 5]
    [1 5 6 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 4 4 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 4 4 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 4 4 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 4 4 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 4 4 4 4 4 15 15 15 15 5 5 13 13 13 13 5 5 5 5]
    [4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5]])

(fn drawm [t quads]
    (each [i row (ipairs tilemap)]
        (each [j tile (ipairs row)]
            (if (~= tile 0)

                ;(love.graphics.push)
                ;(love.graphics.scale 2 2)
                (love.graphics.draw t (. quads tile) (* j _G.twidth) (* i _G.theight))
                ;(love.graphics.pop)

                ))))

(global drawmap drawm)
