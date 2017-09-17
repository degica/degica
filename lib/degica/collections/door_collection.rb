module Degica
  class DoorCollection < Collection
    def actions
      [Action.new(:doors, self)]
    end

    def describe
      return "The are no doors here..." if empty?

      desc = []
      desc << "You see #{size} doors:" if size > 1
      desc << map(&:describe)
      desc.flatten.join("\n")
    end
  end
end
