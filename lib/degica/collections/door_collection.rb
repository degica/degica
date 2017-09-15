module Degica
  class DoorCollection < Collection
    def actions
      [Action.new(:doors, self)]
    end

    def describe
      return "The are no doors here..." if empty?

      if size > 1
        "There are #{size} doors in the room."
      else
        "There is a door."
      end
    end
  end
end
