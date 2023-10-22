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

        @last_asteroid_spawned_at = 0
        @asteroid_spawn_interval = 5_000
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
        angle = rand(359)
        position = CyberarmEngine::Vector.new(
          @planet.position.x + Gosu.offset_x(angle, DESIGN_RESOLUTION_HEIGHT + LARGE_ASTEROID_SIZE),
          @planet.position.y + Gosu.offset_y(angle, DESIGN_RESOLUTION_HEIGHT + LARGE_ASTEROID_SIZE)
        )

        [
          position,
          (@planet.position - position).normalized * rand(1.0..2.0)
        ]
      end

      def spawn_asteroid
        position, velocity = choose_asteroid_position_and_velocity
        @objs << GameObjects::Asteroid.new(position: position, velocity: velocity)
      end
    end
  end
end
