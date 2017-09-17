module Degica
  class TableWithRuby < Object
    def name
      :table
    end

    def initialize
      @objects = ObjectCollection.new([Ruby.new])
    end

    def describe
      "The table is quite old. You see a (ruby) on top of the table.".highlight
    end
  end
end
