module PlanetaryDefense
  class GameObject
    include CyberarmEngine::Common

    module ZOrder
      PLANET = 20_000
      MOON = PLANET
      ASTEROID = 25_000
      DRONE = 30_000
    end

    attr_accessor :position, :velocity, :angle

    def initialize
      @position = CyberarmEngine::Vector.new
      @velocity = CyberarmEngine::Vector.new
      @angle = 0
      @scale = 0.5
      @image_origin = 0.5

      setup
    end

    def setup
    end

    def draw
    end

    def update(dt)
    end
  end
end
