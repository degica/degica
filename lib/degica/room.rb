module Degica
  class Room
    attr_accessor :id, :description, :doors

    def methods
      [:doors]
    end

    def inspect
      "#<Room(#{id})>"
    end
  end
end
