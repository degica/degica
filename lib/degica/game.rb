module Degica
  class Game
    def initialize
      objects = [
        Object.new(:table, "There is a small (ruby) laying on the table.", [RubyObject.new])
      ]
      rooms = [
        Room.new("It's pitch black"),
        Room.new("There is a small (table) in the middle of the room.", objects),
        Room.new("The room is dimly lit. There's a man standing in the corner. It's (matz), the creator.", [MatzObject.new])
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
          when @actor.focus
            # Don't output anything if we're already focused.
            # This allows actionable objects to return themselves without outputting
            # their description again.
          when Actionable
            @actor.focus = output
            message = output.describe
            puts message unless message.nil?
          else
            puts CodeRay.scan(output.inspect, :ruby).terminal
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
