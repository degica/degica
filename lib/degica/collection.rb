module Degica
  class Collection < Array
    attr_reader :name

    def initialize(name, items = [])
      @name = name
      define_singleton_method name do
        "There are #{items.count} #{name.pluralize}."
      end
    end
  end
end
