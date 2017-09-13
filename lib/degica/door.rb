module Degica
  class Door
    attr_reader :from, :to, :description

    def initialize(from_, to_, description_)
      @from, @to, @description = from_, to_, description_

      @from.doors << self
      @to.doors << self
    end

    def open
      puts "You open the door."
    end

    def inspect
      @description
    end
  end
end
