module Degica
  class Actor
    attr_reader :location, :objects, :actions

    def initialize(location)
      @location = location
      @actions = location.actions
      @objects  = Objects.new
    end

    def do(name)
      actions.find { |action| action.name == name }.do
    end

    def inspect
      @location.description
    end
  end
end
