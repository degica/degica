module Degica
  class RubyObject < Object
    include Actionable

    def initialize
      @name = :ruby
      @description = "A shiny ruby."
      @objects = []
    end

    def actions
      return [] if collection.is_a?(InventoryCollection)
      [Action.new(:take, self)]
    end

    def take
      collection.pickup(self)
    end

    def describe
      File.read(Degica.root + 'data/images/ruby.ansi')
    end
  end
end
