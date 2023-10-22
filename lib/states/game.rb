module PlanetaryDefense
  module States
    class Game < CyberarmEngine::GuiState
      def setup
        flow(width: 1.0, height: 1.0, background: 0xff_252525) do
          stack(width: 256, height: 1.0, padding: 16) do
          end
        end

        @stars = []
        1024.times do
          @stars << GameObjects::Star.new(
            position: CyberarmEngine::Vector.new(
              rand(0..PlanetaryDefense::DESIGN_RESOLUTION_WIDTH),
              rand(0..PlanetaryDefense::DESIGN_RESOLUTION_HEIGHT)
            ),
            color: [
              Gosu::Color.rgba(200, 200, 0, 255),
              Gosu::Color.rgba(150, 150, 0, 255),
              Gosu::Color.rgba(100, 100, 0, 255),
            ].sample,
            last_updated_at: Gosu.milliseconds,
            duration: rand(1_500..5_000),
            time_elapsed: 0,
            tween: [:linear, :ease_in_out].sample
          )
        end

        @objs = []
        @objs << @planet = GameObjects::Planet.new
        @objs << @moon = GameObjects::Moon.new

        @asteroid_spawn_interval = 5_000
        @last_asteroid_spawned_at = -@asteroid_spawn_interval

        @angle_table_index = 0
        @size_table_index = 0
        @velocity_table_index = 0
      end

      def draw
        super

        Gosu.scale(@scale) do
          @stars.each { |o| o.draw }

          @objs.each { |o| o.draw }
        end
      end

      def update
        super

        @scale = window.width.to_f / PlanetaryDefense::DESIGN_RESOLUTION_WIDTH

        @stars.each { |o| o.update(PlanetaryDefense::FIXED_UPDATE_INTERVAL) }
        @objs.each { |o| o.update(PlanetaryDefense::FIXED_UPDATE_INTERVAL) }

        if Gosu.milliseconds - @last_asteroid_spawned_at >= @asteroid_spawn_interval
          @last_asteroid_spawned_at = Gosu.milliseconds

          spawn_asteroid
        end
      end

      def choose_asteroid_position_and_velocity
        angle = angle_table
        position = CyberarmEngine::Vector.new(
          @planet.position.x + Gosu.offset_x(angle, DESIGN_RESOLUTION_HEIGHT + LARGE_ASTEROID_SIZE),
          @planet.position.y + Gosu.offset_y(angle, DESIGN_RESOLUTION_HEIGHT + LARGE_ASTEROID_SIZE)
        )

        [
          position,
          (@planet.position - position).normalized * velocity_table
        ]
      end

      def spawn_asteroid
        position, velocity = choose_asteroid_position_and_velocity
        @objs << GameObjects::Asteroid.new(size: size_table, position: position, velocity: velocity)
      end

      def angle_table
        a = Random::ANGLE_TABLE[@angle_table_index]

        @angle_table_index += 1
        @angle_table_index %= Random::ANGLE_TABLE.size

        return a
      end

      def size_table
        s = Random::SIZE_TABLE[@size_table_index]

        @size_table_index += 1
        @size_table_index %= Random::SIZE_TABLE.size

        return s
      end

      def velocity_table
        v = Random::VELOCITY_TABLE[@velocity_table_index]

        @velocity_table_index += 1
        @velocity_table_index %= Random::VELOCITY_TABLE.size

        return v
      end
    end
  end
end
