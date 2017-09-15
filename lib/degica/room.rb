module Degica
  class Room
    include Actionable
    attr_accessor :description, :doors

    def initialize(description, objects = [])
      @description = description.highlight
      @doors = DoorCollection.new
      @objects = ObjectCollection.new(objects)
    end

    def actions
      @doors.actions + @objects.actions
    end

    def describe
      @description
    end
  end
end
