begin
  require_relative "../cyberarm_engine/lib/cyberarm_engine"
rescue LoadError
  require "cyberarm_engine"
end

module PlanetaryDefense
  ROOT_PATH = File.expand_path(".", __dir__)
  DESIGN_RESOLUTION_WIDTH = 1280 # px
  DESIGN_RESOLUTION_HEIGHT = 720 # px
  LARGE_ASTEROID_SIZE = 75 # px
  FIXED_UPDATE_INTERVAL = 0.016 # 60 updates/second
end

require_relative "lib/version"
require_relative "lib/theme"
require_relative "lib/window"
require_relative "lib/fixed_random"
require_relative "lib/states/main_menu"
require_relative "lib/states/game"

require_relative "lib/game_object"
require_relative "lib/game_objects/star"
require_relative "lib/game_objects/planet"
require_relative "lib/game_objects/moon"
require_relative "lib/game_objects/asteroid"
require_relative "lib/game_objects/drone"

PlanetaryDefense::Window.new(width: 1280, height: 720, resizable: true).show
