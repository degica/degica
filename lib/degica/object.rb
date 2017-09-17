module Degica
  class Object
    include Actionable
    include Collectable

    def initialize(objects = [])
      @objects = ObjectCollection.new(objects)
    end

    def actions
      @objects.actions
    end

    def name
      raise NotImplementedError
    end

    def describe
      raise NotImplementedError
    end

    def prompt
      name
    end
  end
end
