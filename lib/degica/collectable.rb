module Degica
  # Collectable instances store a reference to the {Degica::Collection}
  # they belong to. {Degica::Collection} handles updating the state.
  module Collectable
    attr_accessor :collection
  end
end
