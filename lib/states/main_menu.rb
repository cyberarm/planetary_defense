module PlanetaryDefense
  module States
    class MainMenu < CyberarmEngine::GuiState
      def setup
        theme(THEME)

        flow(width: 1.0, height: 1.0, background: 0xff_252525) do
          stack(width: 384, height: 1.0, padding: 16, background: 0xff_757575, border_thickness_right: 4, border_color_right: 0x88_ffffff) do
            banner "Planetary Defense"

            button("PLAY", width: 1.0) do
              push_state(Game)
            end

            button("EXIT", width: 1.0) do
              close
            end

            flow(fill: true)

            caption "Planetary Defense v#{PlanetaryDefense::VERSION}\nA game by cyberarm"
          end

          stack(fill: true, height: 1.0, padding: 16) do
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/planet.png")
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/moon.png")
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/asteroid_large.png")
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/asteroid_medium.png")
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/asteroid_small.png")
            image get_image("#{PlanetaryDefense::ROOT_PATH}/assets/drone.png")
          end
        end
      end
    end
  end
end
