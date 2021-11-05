#!/usr/bin/env lua

-- bootstrap fennel compiler
fennel = require("lib.fennel")
table.insert(package.loaders, fennel.make_searcher({correlate=true}))

-- require fennel game file
--require("game")
require("map")
require("player")

function love.draw()
    drawmap()
    --Draw the image
    love.graphics.push()
    love.graphics.scale(2, 2)   -- reduce everything by 50% in both X and Y coordinates
    --Draw the player and multiple its tile position with the tile width and height
    love.graphics.draw(player.img, player.x * twidth, player.y * theight)
    love.graphics.pop()
end

