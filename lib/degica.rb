require "yaml"
require "readline"
require "coderay"
require "ostruct"

# preload translations
require "faker"
Faker::Name.first_name

# core
require "degica/collectable"
require "degica/actionable"
require "degica/room_loader"
require "degica/actor"
require "degica/game"
require "degica/door"
require "degica/nil_actionable"
require "degica/action"
require "degica/context"
require "degica/room"
require "degica/ansi"
require "degica/version"

# generators
require "degica/generators/door_name_generator"

# objects
require "degica/object"
require "degica/objects/ruby"
require "degica/objects/job_posting"
require "degica/objects/table_with_ruby"
require "degica/objects/people/person"
require "degica/objects/people/matz"
require "degica/objects/people/hacker"
require "degica/objects/people/jack"

# collections
require "degica/collection"
require "degica/collections/object_collection"
require "degica/collections/door_collection"
require "degica/collections/inventory_collection"

# core extentions
require "degica/core_ext/string"
require "degica/core_ext/did_you_mean"

module Degica
  def self.root
    File.expand_path '../..', __FILE__
  end
end
