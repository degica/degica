module Degica
  class ObjectCollection < Collection
    def pickup(item_)
      puts "You picked up a (#{item_.name}).".highlight
      Actor.current.pickup(item_)
      NilActionable.new
    end

    def actions
      map { |obj| Action.new(obj.name, obj) }
    end
  end
end
