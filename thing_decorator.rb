class ThingDecorator < ApplicationDecorator

  alias thing o

  THING_PASS_THROUGH_METHODS = %w[method_one method_two method_returns_boolean?]

  THING_PASS_THROUGH_METHODS.each do |method|
    define_method method do |*args|
      episode.send(method){args}
    end
  end
  
  def a_method
    # some code that transforms thing.another_method in some useful way
  end
  
  private
  
  def an_internal_method
    # some calculations you don't want to expose in the view
  end
end
