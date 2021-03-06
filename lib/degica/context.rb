module Degica
  class Context < BasicObject
    def initialize(actor)
      @actor = actor
      @focus = actor.focus || NilActionable.new
    end

    def actions
      (@actor.actions + @focus.actions).uniq(&:name)
    end

    def method_missing(method, *args)
      if match = @focus.actions.find { |action| action.name == method }
        @focus.do(match.name, *args)
      elsif match = @actor.actions.find { |action| action.name == method }
        @actor.do(match.name, *args)
      else
        super
      end
    end
  end
end
