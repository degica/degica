module Degica
  class Actor
    attr_reader :room

    def initialize(room)
      @room = room
    end

    def methods
      [:inspect, :doors, :go]
    end

    def go(room)
      raise ArgumentError, "ArgumentError: argument must be a room instance" unless room.is_a?(Room)
      puts "You enter the door."
      @room = room
      @room.description
    end

    def doors
      @room.doors
    end

    def inspect
      @room.description
    end
  end
end
