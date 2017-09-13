module Degica
  class Objects < Array
    def actions
      map(&:action).flatten.uniq
    end
  end
end
