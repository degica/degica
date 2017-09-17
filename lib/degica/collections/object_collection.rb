module Degica
  class ObjectCollection < Collection
    def actions
      map { |obj| Action.new(obj.name, obj) }
    end

    def describe
      if empty?
        nil
      else
        desc = []
        desc << "There are some objects here:"
        desc << "[" + map(&:name).join(',') + "]"
        desc.join("\n")
      end
    end
  end
end
