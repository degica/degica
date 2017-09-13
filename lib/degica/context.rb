module Degica
  class Context < BasicObject
    def initialize(actor)
      @actor = actor
      @focus = actor.focus || NilActionable.new
    end

    def method_missing(method)
      if method == :actions
        (@actor.actions + @focus.actions).uniq(&:name)
      elsif match = @focus.actions.find { |action| action.name == method }
        @focus.do(match.name)
      elsif match = @actor.actions.find { |action| action.name == method }
        @actor.do(match.name)
      elsif match = @actor.objects.find { |object| object.name == method }
        match
      else
        super
      end
    end

    def inspect
      @actor.inspect
    end
  end
end
