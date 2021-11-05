#!/usr/bin/env lua

-- bootstrap fennel compiler
fennel = require("lib.fennel")
table.insert(package.loaders, fennel.make_searcher({correlate=true}))

-- require fennel game file
require("game")
require("map")
require("player")

