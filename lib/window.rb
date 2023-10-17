module PlanetaryDefense
  class Window < CyberarmEngine::Window
    def setup
      self.show_cursor = true
      self.caption = "Planetary Defense v#{PlanetaryDefense::VERSION} #{Gosu.language}"

      push_state(CyberarmEngine::IntroState, forward: PlanetaryDefense::States::MainMenu)
    end
  end
end
