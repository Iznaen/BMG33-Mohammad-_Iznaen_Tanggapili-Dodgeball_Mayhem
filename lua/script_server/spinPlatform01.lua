local function platformRotate()
    --#print("platformRotate")
    local map = World:GetStaticMap("map001")
    local Platform = map.Root:FindFirstChild("spinPlatform01")
    
    if not Platform then
      return
    end
    
    local centerPoint = Vector3.new(4, 14.5, 2)
    local axis = Vector3.Up
    Platform:RotateAround(centerPoint, axis, 1)
end

local rotateTimer = Timer.new(1, platformRotate)
rotateTimer.Loop = true -- open timer loop and run it
rotateTimer:Start() -- start timer