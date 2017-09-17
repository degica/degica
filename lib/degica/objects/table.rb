module Degica
  class Table < Object
    def name
      :table
    end

    def initialize
      @objects = ObjectCollection.new([Ruby.new])
    end

    def describe
      desc = []
      desc << "The table is quite old."
      desc << @objects.describe
      desc.join("\n")
    end
  end
end
