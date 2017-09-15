module Degica
  class ObjectCollection < Collection
    def pickup(item_)
      puts "You picked up a (#{item_.name}).".highlight
      Actor.current.inventory << delete(item_)
      NilActionable.new
    end

    def actions
      map { |obj| Action.new(obj.name, obj) }
    end

    def item_name
      :object
    end
  end
end
