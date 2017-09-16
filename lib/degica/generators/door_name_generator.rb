module Degica
  module DoorNameGenerator
    COLORS = [
      'blue',
      'red',
      'green',
      'black',
      'white',
      'brown',
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

    class << self
      def sample
        desc = sample_with_order([ADJECTIVES.sample, MATERIAL.sample, COLORS.sample]).join(' ')
        "A #{desc} door."
      end

      private

      def sample_with_order(words)
        size = words.size
        indexes = size.times.map { |n| n }.sample(rand(1..size)).sort
        indexes.collect { |i| words[i] }
      end
    end
  end
end
