local meter = {}

local track = false
local delayTimer
local mTxt

function meter.new(delay, fill, xPos, yPos)
  fill = fill or {1,1,1}
  xPos = xPos or display.screenOriginX
  yPos = yPos or display.screenOriginY

  if delay == 0 then
    delay = nil
  end

  local pausedTxt = "Memory monitor paused. Click to toggle."

  mTxt = display.newText({
    text = pausedTxt,
    x = xPos,
    y = yPos,
    font = native.systemFont,
    align = align
  })

  mTxt:setFillColor(unpack(fill))

  mTxt.anchorX = 0
  mTxt.anchorY = 0

  local function update()
    collectgarbage()
    local collectCnt = collectgarbage("count")
    local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000

    mTxt.text = collectCnt .. "/" .. textMem
  end

  local function onToggle(evt)
    if track == true then
      if delay then
        update()
        delayTimer = timer.performWithDelay(delay, update, -1)
      else
        Runtime:addEventListener( "enterFrame", update )
      end
    else
      if delay then
        timer.cancel(delayTimer)
      else
        Runtime:removeEventListener( "enterFrame", update )
      end
      mTxt.text = pausedTxt
    end  
  end

  mTxt:addEventListener("tap", function(evt)
    if track == true then
      track = false
    else
      track = true
    end
    onToggle()
  end)

end

return meter
