module Degica
  class Door
    attr_reader :from, :to

    def initialize(from_, to_)
      @from, @to = from_, to_
    end

    def open
      puts "You open the door"
    end

    def inspect
      "Door"
    end
  end
end
