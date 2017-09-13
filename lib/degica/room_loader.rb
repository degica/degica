module Degica
  class RoomLoader
    def self.load
      # load rooms.xml
      @yaml = YAML::load_file( File.dirname(__FILE__) + "/../../data/rooms.yml" )

      # build rooms
      @rooms = @yaml.inject({}) do |hash, e|
        room = Room.new(e["description"])
        hash[e["id"]] = room
        hash
      end

      # expand doors
      @rooms.each do |id, room|
        room.doors.each do |_, goto_id|
          @rooms[id].doors << Door.new(@rooms[id], @rooms[goto_id])
        end
      end

      @rooms
    end
  end
end
