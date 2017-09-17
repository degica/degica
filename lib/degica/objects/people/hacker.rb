module Degica
  class Hacker < Person
    def name
      :hacker
    end

    def quote
      Faker::Hacker.say_something_smart
    end

    def description
      desc = []
      desc << "He looks like he could hack into anything."
      desc << "He is holding a ruby." if holding?(:ruby)
      desc
    end
  end
end
