require "yaml"
require "readline"
require "coderay"

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

# objects
require "degica/object"
require "degica/objects/ruby_object"

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
