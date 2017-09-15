module Degica
  class Door
    include Actionable
    attr_reader :description

    def initialize(room1, room2, description)
      @description = description
      @rooms = [room1, room2]

      # connect rooms
      room1.doors << self
      room2.doors << self
    end

    def actions
      [Action.new(:enter, self)]
    end

    def enter
      next_room = (@rooms - [Actor.current.location])[0]
      Actor.current.location = next_room
      next_room
    end

    def describe
      @description
    end

    def prompt
      "door"
    end
  end
end
