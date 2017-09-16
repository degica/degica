module Degica
  class ObjectCollection < Collection
    def actions
      map { |obj| Action.new(obj.name, obj) }
    end
  end
end
