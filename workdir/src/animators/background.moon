Animator = require "animators/abstract-animator"

class Background extends Animator
  name = "background"
  new: (themeConfig) =>
    @image = love.graphics.newImage("assets/background.jpg")
  draw: =>
    -- love.graphics.draw(@image)

return Background
