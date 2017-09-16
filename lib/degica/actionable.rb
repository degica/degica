module Degica
  # Allows objects to be actionable in the game REPL.
  # Actionable objects can be focused, described,
  # and can expose actions in the REPL.
  module Actionable
    # Customized REPL prompt for action. For example,
    # if the prompt method returned "book"
    #
    #   book> ...
    def prompt
      nil
    end

    # @returns [Array<Degica::Action>] a list of actions.
    def actions
      []
    end

    # @returns [String] string describing the object.
    def describe
      nil
    end

    def do(name)
      actions.find { |action| action.name == name }.do
    end
  end
end
