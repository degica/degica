module Degica
  class NilActionable
    include Actionable

    def actions
      []
    end

    def inspect
      nil
    end
  end
end
