begin
  require_relative "../cyberarm_engine/lib/cyberarm_engine"
rescue LoadError
  require "cyberarm_engine"
end

module PlanetaryDefense
  ROOT_PATH = File.expand_path(".", __dir__)
end

require_relative "lib/version"
require_relative "lib/theme"
require_relative "lib/window"
require_relative "lib/states/main_menu"
require_relative "lib/states/game"

require_relative "lib/game_object"
require_relative "lib/game_objects/planet"
require_relative "lib/game_objects/moon"
require_relative "lib/game_objects/asteroid"
# require_relative "lib/game_objects/drone"

PlanetaryDefense::Window.new(width: 1280, height: 720, resizable: true).show
