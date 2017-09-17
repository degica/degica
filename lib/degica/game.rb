module Degica
  class Game
    def initialize
      # setup scenes
      rooms = [
        Room.new("It's pitch black. There's a (hacker) in the room", [Hacker.new]),
        Room.new("It's a deadend. There's a person standing in the corner. It's (jack) momose.", [Jack.new]),
        Room.new("The room is dimly lit. There's a man standing in the corner. It's (matz), the creator.", [Matz.new])
      ]

      # spawn actor in random room
      starting_room = rooms.sample
      starting_room.generate_doors!(rooms)
      @actor = Actor.new(starting_room)

      # preload translations for Faker
      Faker::Name.first_name

      @@objects = OpenStruct.new(
        rooms: rooms,
        actor: @actor
      )
    end

    def self.objects
      @@objects
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
          when NilClass
            puts @actor.describe
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
