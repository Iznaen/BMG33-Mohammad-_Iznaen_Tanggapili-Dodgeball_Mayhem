print('script_server:hello world')

require "script_server.spinPlatform01"


local elevator = require "script_server.elevator01"
local sliding01 = require "script_server.slidingPart01"
local sliding02 = require "script_server.slidingPart02"
local sliding03 = require "script_server.slidingPart03"
local map = World:GetStaticMap("map001")


local timer = Timer.new(160 , function()
    elevator:Start(map)
    sliding01:Start(map)
    sliding02:Start(map)
    sliding03:Start(map)
end)

timer:Start()

--*require "script_server.moveObject"