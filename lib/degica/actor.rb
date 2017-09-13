module Degica
  class Actor
    include Actionable

    attr_reader :objects, :actions
    attr_accessor :location, :focus

    def initialize(location)
      @location = location
      @objects  = Objects.new
      @focus = nil

      # TODO Remove global state (v2)
      @@current = self
    end

    def actions
      [Action.new(@location.name, @location)] + @location.actions
    end

    def inspect
      @location.description
    end

    def self.current
      @@current
    end
  end
end
