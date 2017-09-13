module Degica
  module Actionable
    def do(name)
      actions.find { |action| action.name == name }.do
    end
  end
end
