module Degica
  class Actor
    include Actionable

    attr_reader :location, :objects, :actions
    attr_accessor :focus

    def initialize(location)
      @location = location
      @actions = [Action.new(location.name, location)] + location.actions
      @objects  = Objects.new
      @focus = nil

      # TODO Remove global state (v2)
      @@current = self
    end

    def inspect
      @location.description
    end

    def self.current
      @@current
    end
  end
end
