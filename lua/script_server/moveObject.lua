

local function movingObject()
  local map = World:GetStaticMap("map001")
  local object = map.Root:FindFirstChild("testMove01")
  
  if not object then
    return
  end
  
  local startPoint = Vector3.new(-10, 0, 0)
  local speed = 0.05
  object:Move(startPoint * speed)
end

local moveTimer = Timer.new(8, movingObject)
moveTimer.Loop = true
moveTimer:Start()
