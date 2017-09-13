module Degica
  class Context
    def initialize(actor)
      @actor = actor
      define_actions(actor)
      define_objects(actor)
    end

    def define_actions(actor)
      define_singleton_method :actions do
        actor.actions.inspect
      end
      actor.actions.each do |action|
        define_singleton_method action.name do
          actor.do(action.name)
        end
      end
    end

    def define_objects(actor)
      actor.objects.each do |object|
        define_singleton_method object.name do
          object.inspect
        end
      end
    end
  end
end
