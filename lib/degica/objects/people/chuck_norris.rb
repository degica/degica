module Degica
  class ChuckNorris < Person
    def name
      :chuck
    end

    def quote
      Faker::ChuckNorris.fact
    end

    def description
      "He's flexing his muscles."
    end
  end
end
