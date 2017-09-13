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
      [Action.new(:open, self)]
    end

    def open
      @open = true
    end

    def close
      @open = false
    end

    def inspect
      @description
    end
  end
end
