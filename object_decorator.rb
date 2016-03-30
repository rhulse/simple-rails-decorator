class ThingDecorator < ApplicationDecorator

  alias thing o

  THING_PASS_THROUGH_METHODS = %w[]

  THING_PASS_THROUGH_METHODS.each do |method|
    define_method method do |*args|
      episode.send(method){args}
    end
  end
  
  def a_method
    # some code that transforms thing.another_method in some useful way
  end
  
end
