;;
;; tile.fnl
;;
;; tileset related functions
;;
(fn load-tileset [file ncols nrows]
  "load a series of love quads from the given tileset

  params:
    - file (string): tileset asset file
    - ncols (number): number of columns in tileset
    - nrows (number): number of rows in tileset

  returns:
    - table with the following keys:
      - tiles (love quad): seq table of love quads
      - width (number): tile width
      - height (number): tile height
"
  (let [tileset (love.graphics.newImage file)
        width (/ (tileset:getWidth) nrows)
        height (/ (tileset:getHeight) ncols)
        quads {}]
    ;; this can probs be simplified
    (for [i 0 (- nrows 1)]
      (for [j 0 (- ncols 1)]
        (let [ypos (* j (+ width))
              xpos (* i (+ height))]
          (table.insert quads
                        (love.graphics.newQuad
                         ypos
                         xpos
                         width
                         height
                         (tileset:getWidth)
                         (tileset:getHeight))))))
    {:image tileset
     :quads quads
     :width width
     :height height}))

{:load-tileset load-tileset}
