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
  end
end
