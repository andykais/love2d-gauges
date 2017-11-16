keyboard = ->
  if love.keyboard.isDown("f") then
    print "frame rate: #{love.timer.getFPS()} fps"
return keyboard
