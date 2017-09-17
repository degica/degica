module Degica
  class Room
    include Actionable
    attr_accessor :description, :doors

    def initialize(description, objects = [])
      @description = description.highlight
      @doors = DoorCollection.new
      @objects = ObjectCollection.new(objects)
      @generated = false
    end

    def generate!
      return if @generated
      @generated = true

      rooms = Game.objects.rooms.select do |room|
        room.doors.empty? && room != self
      end.sample(rand(1..2))

      rooms.map { |r| make_door(r) }
    end

    def actions
      actions = @doors.actions + @objects.actions
      actions << Action.new(:room, self)
      actions << Action.new(:door, @doors.first) if @doors.size == 1
      actions
    end

    def describe
      @description
    end

    private

    def make_door(room)
      Door.new(self, room)
    end
  end
end
