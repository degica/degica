module Degica
  module ANSI
    COLORS = {
      none: "\e[0m",
      yellow: "\e[1;33m"
    }

    class << self
      def clear_screen
        puts "\x1b[2J"
      end

      def highlight(word, color)
        COLORS[color] + word + COLORS[:none]
      end
    end
  end
end
