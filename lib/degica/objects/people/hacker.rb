module Degica
  class Hacker < Person
    def name
      :hacker
    end

    def quote
      Faker::Hacker.say_something_smart
    end

    def description
      "He looks like he could hack into anything."
    end
  end
end
