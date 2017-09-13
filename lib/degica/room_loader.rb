module Degica
  class RoomLoader
    def self.load
      # load rooms.xml
      @rooms = YAML::load_file( File.dirname(__FILE__) + "/../../data/rooms.yml" )

      # load doors.xml
      @doors = YAML::load_file( File.dirname(__FILE__) + "/../../data/doors.yml")

      # build rooms
      @rooms = @rooms.inject({}) do |hash, e|
        room = Room.new(e["description"])
        hash[e["id"]] = room
        hash
      end

      # expand doors
      @doors.each do |door|
        description = door["description"]
        from = @rooms[door["from"]]
        to = @rooms[door["to"]]

        @rooms[door["from"]].doors << Door.new(from, to, description)
      end

      @rooms
    end
  end
end
