module Degica
  class Context < BasicObject
    def initialize(actor)
      @actor = actor
      @focus = actor.focus || NilActionable.new
    end

    def actions
      ([Action.new(:describe, self)] + @actor.actions + @focus.actions).uniq(&:name)
    end

    def method_missing(method)
      if match = @focus.actions.find { |action| action.name == method }
        @focus.do(match.name)
      elsif match = @actor.actions.find { |action| action.name == method }
        @actor.do(match.name)
      elsif match = @actor.objects.find { |object| object.name == method }
        match
      else
        super
      end
    end

    def describe
      @actor.focus&.describe|| @actor.describe
    end
  end
end
