module Degica
  class Door
    include Actionable
    attr_reader :from, :to, :description

    def initialize(from_, to_, description_)
      @from, @to, @description = from_, to_, description_
      @from.doors << self
      @to.doors << self
      @open = false
    end

    def actions
      door = self
      [Action.new(:open, door), Action.new(:door, door)]
    end

    def open
      @open = true
      "You open the door."
    end

    def close
      @open = false
      "You close the door."
    end

    def inspect
      @description + " The door is #{@open ? "open" : "closed"}."
    end
  end
end
