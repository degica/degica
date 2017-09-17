module Degica
  class Matz < Person
    def name
      :matz
    end

    def quote
      Faker::Matz.quote
    end

    def description
      desc = "He's smiling at you. You smile back."
      desc += "\nHe is holding a ruby." if holding?(:ruby)
      desc
    end
  end
end
