module PlanetaryDefense
  module States
    class Game < CyberarmEngine::GuiState
      def setup
        flow(width: 1.0, height: 1.0, background: 0xff_252525) do
          stack(width: 256, height: 1.0, padding: 16) do
          end
        end

        @objs = []
        @objs << GameObjects::Planet.new
        @objs << GameObjects::Moon.new

        @objs << GameObjects::Asteroid.new
      end

      def draw
        super

        @objs.each { |o| o.draw }
      end

      def update
        super

        @objs.each { |o| o.update(0.016) }
      end
    end
  end
end
