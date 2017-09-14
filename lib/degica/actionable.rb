module Degica
  module Actionable
    def prompt
      nil
    end

    def do(name)
      actions.find { |action| action.name == name }.do
    end
  end
end
