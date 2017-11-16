{:ErrorCodes} = require "lib/errors"

class Animator
  update: =>
    error("#{ErrorCodes.NotImplemented}: Animator class method update")
  draw: =>
    error("#{ErrorCodes.NotImplemented}: Animator class method draw")
return Animator
