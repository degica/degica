module Degica
  class RubyObject < Object
    include Actionable

    def initialize
      @name = :ruby
      @objects = []
    end

    def actions
      if Actor.current.has_item?(self)
        []
      else
        [Action.new(:take, self)]
      end
    end

    def take
      Actor.current.pickup(self)
      NilActionable.new
    end

    def describe
      File.read(Degica.root + '/data/images/ruby.ansi')
    end
  end
end
