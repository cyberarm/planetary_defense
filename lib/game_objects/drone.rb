module PlanetaryDefense
  module GameObjects
    class Drone < GameObject
      def setup
        @planet = @options[:planet]
        @image = get_image("#{ROOT_PATH}/assets/drone.png")

        @origin = CyberarmEngine::Vector.new(
          PlanetaryDefense::DESIGN_RESOLUTION_WIDTH / 2.0,
          PlanetaryDefense::DESIGN_RESOLUTION_HEIGHT / 2.0
        )

        @orbital_distance = 100
        @target_angle = 0.0
        @current_angle = 0.0

        @speed = 3.0
      end

      def draw
        @image.draw_rot(@position.x, @position.y, ZOrder::DRONE, @angle, @image_origin, @image_origin, @scale, @scale)
      end

      def update(dt)
        @position += @velocity

        return if @launched

        @target_angle = Gosu.angle(@origin.x, @origin.y, window.mouse_x, window.mouse_y)
        @current_angle = @target_angle
        @angle = @current_angle

        @position = CyberarmEngine::Vector.new(
          @origin.x + Gosu.offset_x(@current_angle, @orbital_distance),
          @origin.y + Gosu.offset_y(@current_angle, @orbital_distance)
        )
      end

      def launch!
        @launched = true
        @velocity = (CyberarmEngine::Vector.new(window.mouse_x, window.mouse_y) - position).normalized * @speed
      end
    end
  end
end
