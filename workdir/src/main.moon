-- user input
{:loadAnimators} = require "config/modify"
-- util lib
keyboard = require "lib/keyboard"
export animators = {}

love.load = ->
  -- love graphics setup
  love.window.setMode(1024, 150)
  love.window.setPosition(1, 925)
  love.graphics.setNewFont(16)
  love.graphics.setBackgroundColor(0,255,255)
  -- load the animations
  animators = loadAnimators()

love.update = ->
  keyboard()

love.draw = ->
  love.graphics.setColor(0,0,0)
  love.graphics.print("hi")
  for _, animator in ipairs(animators)
    animator.draw()
