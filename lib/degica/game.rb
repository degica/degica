module Degica
  class Game
    def initialize
      # setup scenes
      rooms = RoomLoader.load

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

    def welcome_message
      ANSI.clear_screen

      puts "Welcome to"
      puts ANSI.highlight(File.read(Degica.root + '/data/images/degica_quest.txt'), :yellow)
      puts "Welcome, brave ruby warrior!"
      puts "Please enter a username:"

      username = Readline.readline("> ", true)
      RestClient.post "https://meio9thjhi.execute-api.ap-northeast-1.amazonaws.com/production", {username: username}.to_json unless ENV['SKIP']

      puts "Welcome (#{username})! An epic adventure awaits you.\n".highlight
      puts "\n" + @actor.describe + "\n"
      puts "Type (actions) to see what actions you can perform.".highlight
    end

    def start
      welcome_message

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
