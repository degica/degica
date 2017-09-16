module Degica
  class MatzObject < Object
    def initialize
      @name = :matz
      @talked = false
    end

    def actions
      [Action.new(:talk, self)]
    end

    def talk
      puts Faker::Matz.quote
      @talked = true
      self
    end

    def describe
      "He's smiling at you. You smile back. Maybe you should (talk) with him.".highlight
    end
  end
end
