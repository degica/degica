module Degica
  class Jack < Person
    def name
      :jack
    end

    def quote
      [
        "To understand VR, you absolutely have to experience it, to immerse yourself in it.",
        "We’ve dealt with all the hassle and complication of Japanese payments so that companies don’t have to",
        "Komoju helps companies quickly accept payments in Japan, and lets consumers pay the way that they want to pay."
      ].sample
    end

    def description
      desc = "It's Jack Momose. He's the CEO of Degica."
      desc += "\nHe is holding a ruby. He doesn't seem to know what he should do with it." if holding?(:ruby)
      desc
    end
  end
end
