module Degica
  class Action
    attr_reader :name

    def initialize(name_, target_)
      @name = name_
      @target = target_
    end

    def do
      @target.send(name)
    end

    def inspect
      @name.to_s.inspect
    end
  end
end
