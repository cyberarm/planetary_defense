module PlanetaryDefense
  module States
    class Game < CyberarmEngine::GuiState
      def setup
        flow(width: 1.0, height: 1.0, background: 0xff_252525) do
          stack(width: 256, height: 1.0, padding: 16) do
          end
        end
      end
    end
  end
end
