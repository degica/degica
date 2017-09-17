module Degica
  class ChuckNorris < Person
    def name
      :chuck
    end

    def quote
      Faker::ChuckNorris.fact
    end

    def description
      desc = []
      desc << "He's flexing his muscles."
      desc << "He has a ruby." if holding?(:ruby)
      desc
    end
  end
end
