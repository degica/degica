module Degica
  class Context
    def initialize(actor)
      @actor = actor
      @focus = actor.focus || NilActionable.new

      define_actions(@actor)
      define_actions(@focus)

      define_objects(@actor)

      define_singleton_method :actions do
        (@actor.actions + @focus.actions).uniq
      end
    end

    def define_actions(actionable)
      actionable.actions.each do |action|
        define_singleton_method action.name do
          actionable.do(action.name)
          @actor.focus = action.target
          action.target
        end
      end
    end

    def define_objects(actor)
      actor.objects.each do |object|
        define_singleton_method object.name do
          object
        end
      end
    end
  end
end
