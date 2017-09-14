module Degica
  class ObjectCollection < Collection
    def actions
      map { |obj| Action.new(obj.name, obj) }
    end

    def item_name
      :object
    end
  end
end
