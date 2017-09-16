module Degica
  module DoorNameGenerator
    COLORS = [
      'blue',
      'red',
      'green',
      'black',
      'white',
      'brown',
      'purple'
    ]

    MATERIAL = [
      'wooden',
      'metal',
      'granite',
      'bronze',
      'copper',
      'gold',
      'steel'
    ]

    ADJECTIVES = [
      'battered',
      'shiny',
      'round',
      'old',
      'cracked',
      'shattered',
      'rusty',
      'worn out',
      'striped',
      'wide',
      'short',
      'sturdy',
      'tiny'
    ]

    def self.sample
      "A #{ADJECTIVES.sample} #{MATERIAL.sample} #{COLORS.sample} door."
    end
  end
end
