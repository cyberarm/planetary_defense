module PlanetaryDefense
  module GameObjects
    class Asteroid < GameObject
      def setup
        @image = get_image("#{ROOT_PATH}/assets/asteroid_large.png")

        @position.x = window.width / 2
        @position.y = window.height / 2
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::ASTEROID, @angle, @image_origin, @image_origin, @scale, @scale)
      end

      def update(dt)
        @angle += dt * 6
      end
    end
  end
end
