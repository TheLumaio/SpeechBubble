local Bubbles = {}

local function IdExists(id)
  for i,v in pairs(Bubbles) do
    if v.id == id then return true end
  end
  return false
end

function CreateBubble(id, x, y, text, time)
  if IdExists(id) then return end
  local Bubble = {}
  Bubble.id = id
  Bubble.x = x
  Bubble.y = y
  Bubble.text = text
  Bubble.time = time
  Bubble.width = SpeachFont:getWidth(text .. " |  ")
  Bubble.height = SpeachFont:getHeight(text .. " |  ")
  table.insert(Bubbles, Bubble)
end

function DrawBubbles(dt)
  for i,v in pairs(Bubbles) do
    if v.time > 0 then
      love.graphics.setColor(100, 100, 100)
      love.graphics.rectangle("fill", v.x - 2, v.y - 2, v.width + 4, v.height + 4)
      love.graphics.setColor(0, 0, 0)
      love.graphics.rectangle("line", v.x - 2, v.y - 2, v.width + 4, v.height + 4)
      love.graphics.line(v.x-2, v.y, v.x-2, v.y + v.height + 10)

      love.graphics.setColor(255, 255, 255)
      love.graphics.print(v.text .. " | " .. math.floor(v.time), v.x, v.y)
      v.time = v.time - 0.015
    else
      table.remove(Bubbles, i)
    end
  end
end

function RemoveBubble(id)
  for i,v in pairs(Bubbles) do
    if v.id == id then
      table.remove(Bubbles, i)
    end
  end
end
