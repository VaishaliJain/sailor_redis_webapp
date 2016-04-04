package.path = package.path .. ";../src/?.lua"

local sailor = require "sailor"
sailor.launch()
