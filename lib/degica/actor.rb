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
    end

    def inspect
      @location.description
    end
  end
end
