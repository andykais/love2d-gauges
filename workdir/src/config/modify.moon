lyaml = require "lyaml"
background = require "animators/background"

loadAnimators = ->
  -- load theme
  themeYaml = love.filesystem.read("config/user-preferences/theme.yaml")
  themeConfig = lyaml.load(themeYaml)
  -- load chosen gauges
  gaugeInstancesYaml = love.filesystem.read "config/user-preferences/gauge-instances.yaml"
  gaugeInstancesConfig = lyaml.load(gaugeInstancesYaml)

  animators = {}
  for _, v in ipairs(gaugeInstancesConfig)
    gaugeDesign = require "animators/gauges/#{v.gauge_type}"
    table.insert animators, gaugeDesign(themeConfig)
  table.insert(animators, background(themeConfig))

  for k, v in ipairs(animators)
    print "loaded animator", v.name
  return animators

return {:loadAnimators}
