module Degica
  class Room
    include Actionable

    attr_accessor :id, :description, :doors

    def initialize(description, doors = [])
      @description = description
      @doors = doors
    end

    def actions
      [Action.new(:doors, doors)]
    end

    def inspect
      description
    end

    def name
      :room
    end
  end
end
