module Degica
  class DoorCollection < Collection
    def actions
      [Action.new(:doors, self)]
    end

    def item_name
      :door
    end
  end
end
