module Degica
  class Actor
    include Actionable

    attr_accessor :location, :focus
    attr_reader :inventory

    def initialize(location)
      @location = location
      @inventory = InventoryCollection.new
      @focus = nil

      # TODO Remove global state (v2)
      @@current = self
    end

    def actions
      [Action.new(:describe, self), Action.new(:inventory, self)] + @location.actions
    end

    def describe
      @focus&.describe || @location.describe
    end

    def self.current
      @@current
    end
  end
end
