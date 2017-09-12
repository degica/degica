module Degica
  class Game
    def initialize
      rooms = RoomLoader.load
      @actor = Actor.new(rooms["main"])
      @context = @actor
    end

    def start
      ANSI.clear_screen
      puts "Welcome to ⚔️  Degica Quest ⚔️ "
      puts "Type \"methods\" to see what actions you can perform."

      loop do
        input = Readline.readline("> ", true)
        exit if input == "exit"
        begin
          case output = @context.instance_eval(input)
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
