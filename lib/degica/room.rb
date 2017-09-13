module Degica
  class Room
    attr_accessor :id, :description, :doors

    def actions
      [Action.new(:doors, self)]
    end

    def inspect
      "#<Room(#{id})>"
    end
  end
end
