module Degica
  class Collection < Array
    attr_reader :name

    def initialize(name, items = [])
      @name = name
      super(items)

      collection = self
      define_singleton_method name do
        collection
      end
    end

    def inspect
      "There are #{size} #{@name.to_s}."
    end
  end
end
