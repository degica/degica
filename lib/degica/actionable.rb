module Degica
  module Actionable
    # Customized REPL prompt for action
    def prompt
      nil
    end

    # List of actions available in REPL
    def actions
      []
    end

    # Description to output in REPL
    def describe
      inspect
    end

    def do(name)
      actions.find { |action| action.name == name }.do
    end
  end
end
