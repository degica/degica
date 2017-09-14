module Degica
  class Room
    include Actionable
    attr_accessor :description, :doors

    def initialize(description, doors = [])
      @description = description
      @doors = Collection.new(Door, doors)
    end

    def actions
      [Action.new(:doors, doors)]
    end

    def inspect
      description
    end
  end
end
