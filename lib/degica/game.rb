module Degica
  class Game
    attr_reader :actor

    def initialize
      rooms = []
      rooms << Room.new("It's pitch black.")
      rooms << Room.new("There is a small table in the middle of the room. There is something on the table.")
      rooms << Room.new("It's a dead end.")
      doors = []
      doors << Door.new(rooms[0], rooms[1], "A big wood door")
      doors << Door.new(rooms[0], rooms[2], "A black door")
      @actor = Actor.new(rooms[0])
    end

    def start
      ANSI.clear_screen
      puts "Welcome to ⚔️  Degica Quest ⚔️ "
      puts "Type \"actions\" to see what actions you can perform."

      loop do
        input = Readline.readline("> ", true)
        exit if input == "exit"
        begin
          context = Context.new(@actor)
          case output = context.instance_eval(input)
          when String # remove quotes in console i.e. > "string"
            puts output
          else
            puts output.inspect
          end
        rescue Exception => e
          puts e.message
        end
        puts
      end
    end
  end
end
