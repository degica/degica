module Degica
  class Collection < Array
    include Actionable

    def item_name
      nil
    end

    def inspect
      if size > 1
        "There are #{size} #{item_name}s."
      else
        "There is a #{item_name}."
      end
    end
  end
end
