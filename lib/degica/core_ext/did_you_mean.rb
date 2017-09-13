# module DidYouMean
#   module Correctable
#     prepend_features NameError
#     def to_s
#       puts "Hmm '#{name}' is not in the local context."
#     end
#   end
# end
