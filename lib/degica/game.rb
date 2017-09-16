module Degica
  class Game
    def initialize
      objects = [
        Object.new(:table, "There is a small (ruby) laying on the table.", [RubyObject.new])
      ]
      rooms = [
        Room.new("It's pitch black"),
        Room.new("There is a small (table) in the middle of the room.", objects),
        Room.new("It's a deadend")
      ]
      doors = [
        Door.new(rooms[0], rooms[1], "A big wood door."),
        Door.new(rooms[0], rooms[2], "A black door.")
      ]

      @actor = Actor.new(rooms[0])
    end

    def start
      ANSI.clear_screen
      puts "Welcome to"
      puts ANSI.highlight(File.read(Degica.root + '/data/images/degica_quest.txt'), :yellow)
      puts "Type (actions) to see what actions you can perform.".highlight

      loop do
        input = Readline.readline("#{prompt}> ", true)
        exit if input == "exit"
        begin
          context = Context.new(@actor)
          case output = context.instance_eval(input)
          when String # remove quotes in console i.e. > "string"
            puts output
          when Actionable
            @actor.focus = output
            message = output.describe
            puts message unless message.nil?
          else
            puts output.inspect
          end
        rescue Exception => e
          puts e.message
        end
        puts
      end
    end

    private

    def prompt
      @actor.focus&.prompt
    end
  end
end
