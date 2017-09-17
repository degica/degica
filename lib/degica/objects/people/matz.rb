module Degica
  class Matz < Person
    def name
      :matz
    end

    def quote
      Faker::Matz.quote
    end

    def description
      "He's smiling at you. You smile back."
    end
  end
end
