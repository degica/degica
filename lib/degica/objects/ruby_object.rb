module Degica
  class RubyObject < Object
    include Actionable

    def initialize
      @name = :ruby
      @description = "A shiny ruby."
      @objects = []
    end

    def actions
      [Action.new(:take, self)]
    end

    def take
      puts "You pick up the a ruby."
    end

    def inspect
      File.read(Degica.root + 'data/images/ruby.ansi')
    end
  end
end
