module Degica
  class Person < Object
    def initialize
      @talked = false
      @inventory = InventoryCollection.new
    end

    def name
      raise NotImplementedError
    end

    def quote
      raise NotImplementedError
    end

    def description
      raise NotImplementedError
    end

    def actions
      [Action.new(:talk, self), Action.new(:give, self)]
    end

    def inspect
      "#{name.capitalize} says: \"Don't inspect me!\""
    end

    def talk
      @talked = true
      desc = []
      desc << "#{name} says:".capitalize
      desc << '"' + quote + '"'
      desc.join(" ")
    end

    def give(object)
      unless object.is_a?(Object)
        return "\"#{object}\" is not in your (inventory).".highlight
      end

      if @inventory << object.collection.delete(object)
        puts "You gave the (#{object.name}) to #{name}.".highlight
      else
        puts "You don't have any #{object.name}."
      end
      NilActionable.new
    end

    def describe
      desc = []
      desc << description
      desc << "Maybe you should (talk) with him.".highlight unless @talked
      desc
    end

    private

    def holding?(name)
      !!@inventory.find { |item| item.name == name }
    end
  end
end
