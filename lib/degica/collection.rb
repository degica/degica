module Degica
  class Collection < Array
    # A collection is a group of {Degica::Collectable} instances which
    # can expose actions in the current context.
    #
    # Since collections are actionable, custom descriptions and
    # actions can be added when inheriting from this class.
    include Actionable

    def initialize(items = [])
      items.each do |item|
        item.collection = self
      end
      super(items)
    end

    def <<(item)
      item.collection = self
      push(item)
    end

    def actions
      []
    end
  end
end
