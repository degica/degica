module Degica
  class Action
    attr_reader :name, :target

    def initialize(name_, target_)
      @name = name_
      @target = target_
    end

    def do(*args)
      if @target.respond_to?(name)
        @target.send(name, *args)
      else
        @target
      end
    end

    def inspect
      "#{@name}"
    end
  end
end
