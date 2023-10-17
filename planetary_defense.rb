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

PlanetaryDefense::Window.new(width: 1280, height: 800, resizable: true).show
