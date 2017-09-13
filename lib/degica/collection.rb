module Degica
  class Collection < Array
    include Actionable

    def initialize(name, items = [])
      @name = name
      super(items)
      collection = self
      define_singleton_method name do
        collection.inspect
      end
    end

    def actions
      map(&:actions).flatten
    end

    def inspect
      "There are #{size} #{@name.to_s}."
    end
  end
end
