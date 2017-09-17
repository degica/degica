module Degica
  class DoorCollection < Collection
    def actions
      [Action.new(:doors, self)]
    end

    def describe
      return "The are no doors here..." if empty?

      desc = []
      desc << (size > 1 ? "You see #{size} doors:" : "You see one door:")
      desc << map(&:describe)
      desc.flatten.join("\n")
    end
  end
end
