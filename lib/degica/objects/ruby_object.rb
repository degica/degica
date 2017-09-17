module Degica
  class RubyObject < Object
    include Actionable

    def initialize
      @name = :ruby
      @objects = []
    end

    def actions
      if Game.objects.actor.has_item?(self)
        []
      else
        [Action.new(:take, self)]
      end
    end

    def take
      Game.objects.actor.pickup(self)
      NilActionable.new
    end

    def describe
      File.read(Degica.root + '/data/images/ruby.ansi')
    end
  end
end
