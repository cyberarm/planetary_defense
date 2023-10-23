module PlanetaryDefense
  class GameObject
    include CyberarmEngine::Common

    module ZOrder
      STAR = 15_000
      PLATFORM = 18_000
      PLANET = 20_000
      MOON = PLANET
      ASTEROID = 25_000
      DRONE = 30_000
    end

    attr_accessor :position, :velocity, :angle
    attr_reader :image, :scale

    def initialize(options = {})
      @options = options

      @position = @options[:position] || CyberarmEngine::Vector.new
      @velocity = @options[:velocity] || CyberarmEngine::Vector.new
      @angle = @options[:angle] || 0
      @scale = @options[:scale] || 0.5
      @image_origin = @options[:image_origin] || 0.5

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
