AbstractAnimator = require "animators/abstract-animator"
class HalfCircleNeedle extends AbstractAnimator
  new: (themeConfig) =>
    @name = "half circle needle"
    -- @image = themeConfig.images.
  draw: =>
  -- love.graphics.draw(
    -- @image,
    -- @loc.x,
    -- @loc.y
    -- -- self.rotation,
    -- -- 1,1, -- scale factor
    -- -- self.image:getHeight()/2,
    -- -- self.image:getWidth()/2
    -- )
    -- love.grapics.draw()

return HalfCircleNeedle
