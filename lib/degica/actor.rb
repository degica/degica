module Degica
  class Actor
    include Actionable

    attr_reader :objects, :actions
    attr_accessor :location, :focus

    def initialize(location)
      @location = location
      @objects  = ObjectCollection.new
      @focus = nil

      # TODO Remove global state (v2)
      @@current = self
    end

    def actions
      @location.actions
    end

    def describe
      @location.describe
    end

    def self.current
      @@current
    end
  end
end
