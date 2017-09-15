module Degica
  class InventoryCollection < ObjectCollection
    def prompt
      "inventory"
    end

    def item_name
      :items
    end

    def describe
      if empty?
        "You have no items in your inventory."
      else
        "[" + map(&:name).join(', ') + "]"
      end
    end
  end
end
