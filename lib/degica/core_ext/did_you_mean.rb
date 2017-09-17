module DidYouMean
  module Correctable
    prepend_features NameError
    def to_s
      puts "Hmm... I'm not sure what you mean by (#{name}). Type (actions) for a list of commands.".highlight
    end
  end
end
