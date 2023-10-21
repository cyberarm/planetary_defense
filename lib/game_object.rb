module PlanetaryDefense
  class GameObject
    include CyberarmEngine::Common

    module ZOrder
      STAR = 15_000
      PLANET = 20_000
      MOON = PLANET
      ASTEROID = 25_000
      DRONE = 30_000
    end

    attr_accessor :position, :velocity, :angle

    def initialize(options = {})
      @options = options

      @position = CyberarmEngine::Vector.new || @options[:position]
      @velocity = CyberarmEngine::Vector.new || @options[:velocity]
      @angle = 0 || @options[:angle]
      @scale = 0.5 || @options[:scale]
      @image_origin = 0.5 || @options[:image_origin]

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
