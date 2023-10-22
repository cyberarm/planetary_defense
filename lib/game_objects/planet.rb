module PlanetaryDefense
  module GameObjects
    class Planet < GameObject
      def setup
        @image = get_image("#{ROOT_PATH}/assets/planet.png")

        @position = CyberarmEngine::Vector.new(
          PlanetaryDefense::DESIGN_RESOLUTION_WIDTH / 2.0,
          PlanetaryDefense::DESIGN_RESOLUTION_HEIGHT / 2.0
        )
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::PLANET, @angle, @image_origin, @image_origin, @scale, @scale)
      end

      def update(dt)
        @angle += dt * 6
      end
    end
  end
end
