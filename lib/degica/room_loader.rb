module Degica
  class RoomLoader
    def self.load
      # load rooms.xml
      @rooms = YAML::load_file( File.dirname(__FILE__) + "/../../data/rooms.yml" )
      @rooms.collect do |room|
        objects = (room["objects"] || []).map do |o|
          Kernel.const_get("Degica::" + o).new
        end
        Room.new(room["description"], objects)
      end
    end
  end
end
