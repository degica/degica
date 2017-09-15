module Degica
  class Object
    include Actionable

    attr_reader :name, :description

    def initialize(name, description, objects = [])
      @name = name.to_sym
      @description = description.highlight
      @objects = ObjectCollection.new(objects)
    end

    def actions
      @objects.actions
    end

    def describe
      @description
    end

    def prompt
      @name
    end
  end
end
