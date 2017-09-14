module Degica
  class NilActionable
    include Actionable

    def actions
      []
    end
  end
end
