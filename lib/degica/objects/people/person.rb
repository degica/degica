module Degica
  class Person < Object
    def initialize
      @talked = false
    end

    def name
      raise NotImplementedError
    end

    def quote
      raise NotImplementedError
    end

    def description
      raise NotImplementedError
    end

    def actions
      [Action.new(:talk, self)]
    end

    def inspect
      "#{name.capitalize} says: \"Don't inspect me!\""
    end

    def talk
      @talked = true
      desc = []
      desc << "#{name} says:".capitalize
      desc << '"' + quote + '"'
      desc.join(" ")
    end

    def describe
      desc = []
      desc << description
      desc << "Maybe you should (talk) with him.".highlight unless @talked
    end
  end
end
