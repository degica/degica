module Degica
  class DoorCollection < Collection
    def actions
      [Action.new(:doors, self)]
    end

    def describe
      return "The are no doors here..." if empty?
      map(&:describe).join("\n")
    end
  end
end
