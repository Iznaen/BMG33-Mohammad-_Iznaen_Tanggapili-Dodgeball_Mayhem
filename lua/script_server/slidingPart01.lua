local slidingPart = {}

local part = nil
local maxPosition = Vector3.new(-3, 6, -9)
local minPosition = Vector3.new(12, 6, -9) 
local startPosition = Vector3.new(4, 6, -9)
local speed = 0.09
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

function slidingPart:Start(map)
  part = map.Root:FindFirstChild("slidingPart01", true)
  part.WorldPosition = startPosition
  
  nextPosition = minPosition
  local direction = nextPosition - part.WorldPosition
  intervalVector = direction.Normalized * speed
  
  timer = Timer.new (1, Move)
  timer.Loop = true
  timer:Start()
end


return slidingPart