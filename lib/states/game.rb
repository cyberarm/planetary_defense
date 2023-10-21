module PlanetaryDefense
  module States
    class Game < CyberarmEngine::GuiState
      def setup
        flow(width: 1.0, height: 1.0, background: 0xff_252525) do
          stack(width: 256, height: 1.0, padding: 16) do
          end
        end

        @stars = []
        128.times do
          @stars << GameObjects::Star.new(
            position: CyberarmEngine::Vector.new(rand(0..PlanetaryDefense::DESIGN_RESOLUTION_WIDTH), rand(0..PlanetaryDefense::DESIGN_RESOLUTION_WIDTH)),
            color: [
              Gosu::Color::RED,
              Gosu::Color::YELLOW,
              Gosu::Color::BLUE,
              Gosu::Color::GREEN,
            ].sample,
            last_updated_at: Gosu.milliseconds,
            duration: rand(1_500..5_000),
            time_elapsed: 0,
            tween: [:linear, :ease_in_out].sample
          )
        end

        @objs = []
        @objs << GameObjects::Planet.new
        @objs << GameObjects::Moon.new

        @objs << GameObjects::Asteroid.new
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
      end
    end
  end
end
