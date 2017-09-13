module Degica
  class Collection < Array
    attr_reader :name

    def initialize(klass, items = [])
      @name = klass.to_s.split('::').last.downcase
      super(items)
    end

    def inspect
      if size > 1
        "There are #{size} #{@name}s."
      else
        "There is a #{@name}."
      end
    end
  end
end
