module Degica
  module ANSI
    class << self
      def clear_screen
        puts "\x1b[2J"
      end
    end
  end
end
