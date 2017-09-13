module Degica
  class Actor
    include Actionable

    attr_reader :location, :objects, :actions

    def initialize(location)
      @location = location
      @actions = [Action.new(location.name, location)] + location.actions
      @objects  = Objects.new
    end

    def inspect
      @location.description
    end
  end
end
