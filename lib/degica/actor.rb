module Degica
  class Actor
    include Actionable

    attr_accessor :location, :focus
    attr_reader :inventory

    def initialize(location)
      @location = location
      @inventory = InventoryCollection.new
      @focus = nil
      @points = 0
    end

    def pickup(item)
      puts "You picked up a (#{item.name}).".highlight
      @inventory << item.collection.delete(item)
      award(10)
    end

    def award(points)
      @points += points
      puts "You've gained #{ANSI.highlight('10 points', :white)} 💕"
    end

    def has_item?(item)
      @inventory.include?(item)
    end

    def actions
      [Action.new(:describe, self), Action.new(:inventory, self)] + @location.actions
    end

    def describe
      @focus&.describe || @location.describe
    end
  end
end
