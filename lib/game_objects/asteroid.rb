module PlanetaryDefense
  module GameObjects
    class Asteroid < GameObject
      def setup
        @image = get_image("#{ROOT_PATH}/assets/asteroid_#{%w(large medium small).sample}.png")

        @rotation_speed = rand(-60..60)
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::ASTEROID, @angle, @image_origin, @image_origin, @scale, @scale)

        # DEBUG: Heading
        # Gosu.draw_line(
        #   @position.x, @position.y, Gosu::Color::RED,
        #   @position.x + (@velocity.x * 128), @position.y + (@velocity.y * 128), Gosu::Color::RED,
        #   Float::INFINITY
        # )
      end

      def update(dt)
        @angle += dt * @rotation_speed

        @position += @velocity
      end
    end
  end
end
