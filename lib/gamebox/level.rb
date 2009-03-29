# Levels represent on level of game play.  Some games will likely have only one
# level. Level is responsible for loading its background, props, and directors.
require 'inflector'
require 'publisher'
class Level
  extend Publisher

  can_fire_anything
  attr_accessor :directors, :resource_manager, :opts
  def initialize(actor_factory,resource_manager,opts={})
    @actor_factory = actor_factory
    @resource_manager = resource_manager
    @opts = opts
    @directors = []
    setup
  end

  def setup
  end

  def update(time)
    for dir in @directors
      dir.update time
    end
  end

  def draw(target)
    for dir in @directors
      dir.draw target
    end
  end
end