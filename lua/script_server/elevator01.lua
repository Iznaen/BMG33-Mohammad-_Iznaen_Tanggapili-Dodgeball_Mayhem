local liftingPlatform01 = {}

local part = nil
local maxPosition = Vector3.new(-0.5, 16, -23.5)
local minPosition = Vector3.new(-0.5, 9.5, -23.5) 
local startPosition = Vector3.new(-0.5, 12, -23.5)
local speed = 0.065
local nextPosition = nil
local intervalVector = nil
local timer = nil

local function Move()
  local distance = Vector3.Distance(part.WorldPosition, nextPosition)
  
  if distance < 0.5 then
    local isMinPosition = nextPosition == minPosition
    nextPosition = isMinPosition and maxPosition or minPosition
    
    local direction = nextPosition - part.WorldPosition
    intervalVector = direction.Normalized * speed
  
  else
    part.WorldPosition = part.WorldPosition + intervalVector
  end
end

function liftingPlatform01:Start(map)
  part = map.Root:FindFirstChild("elevator01", true)
  part.WorldPosition = startPosition
  
  nextPosition = minPosition
  local direction = nextPosition - part.WorldPosition
  intervalVector = direction.Normalized * speed
  
  timer = Timer.new (1, Move)
  timer.Loop = true
  timer:Start()
end


return liftingPlatform01