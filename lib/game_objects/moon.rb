module PlanetaryDefense
  module GameObjects
    class Moon < GameObject
      def setup
        @image = get_image("#{ROOT_PATH}/assets/moon.png")
        @position.x = window.width / 2
        @position.y = window.height / 2

        @origin = CyberarmEngine::Vector.new(@position.x, @position.y)
        @orbital_distance = 250
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::MOON, @angle, @image_origin, @image_origin, @scale, @scale)
      end

      def update(dt)
        @angle += dt * 6

        @position = CyberarmEngine::Vector.new(
          @origin.x + Gosu.offset_x(@angle, @orbital_distance),
          @origin.y + Gosu.offset_y(@angle, @orbital_distance)
        )
      end
    end
  end
end
