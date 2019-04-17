module Degica
  class Matz < Person
    def name
      :matz
    end

    def quote
      Faker::Quote.matz
    end

    def give(object = nil)
      super.tap do
        if object.name == :ruby
          puts "He thanks you for bringing him the ruby."
          Game.objects.actor.award(20)
        end
      end
    end

    def description
      desc = []
      desc << "He's smiling at you. You smile back."
      desc << "He is holding a ruby." if holding?(:ruby)
      desc
    end
  end
end
