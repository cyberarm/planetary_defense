module PlanetaryDefense
  module GameObjects
    class Asteroid < GameObject
      def setup
        pp @options

        @image = get_image("#{ROOT_PATH}/assets/asteroid_large.png")

        @rotation_speed = rand(6..24)
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::ASTEROID, @angle, @image_origin, @image_origin, @scale, @scale)
      end

      def update(dt)
        @angle += dt * @rotation_speed

        @position += @velocity
        pp @position
      end
    end
  end
end
