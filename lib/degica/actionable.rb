module Degica
  module Actionable
    def do(name)
      actions.find { |action| action.name == name }.tap do |action|
        action.do
      end
    end
  end
end
