module Degica
  class RoomLoader
    def self.load
      # load rooms.xml
      @yaml = YAML::load_file( File.dirname(__FILE__) + "/../../data/rooms.yml" )

      # build rooms
      @rooms = @yaml.inject({}) do |hash, e|
        room = Room.new
        room.id = e["id"]
        room.description = e["description"]
        room.doors = e["doors"]

        hash[e["id"]] = room
        hash
      end

      # expand doors
      @rooms.each do |id, room|
        room.doors.each do |direction, goto_id|
          @rooms[id].doors[direction] = @rooms[goto_id]
        end
      end

      @rooms
    end
  end
end
