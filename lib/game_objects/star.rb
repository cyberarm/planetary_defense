module PlanetaryDefense
  module GameObjects
    class Star < GameObject
      def setup
        @position = @options[:position]
        @color = @options[:color]
        @last_updated_at = @options[:last_updated_at]
        @duration = @options[:duration]
        @time_elapsed = @options[:time_elapsed]
        @tween = @options[:tween]

        @store_color = Gosu::Color.rgba(@color.red, @color.green, @color.blue, 255)
        @white_color = Gosu::Color.rgba(@color.red, @color.green, @color.blue, rand(50..100))

        @radius = rand(0.25..1.0)
        @points = 5

        @animator = CyberarmEngine::Animator.new(start_time: @last_updated_at, duration: @duration, from: @store_color, to: @white_color, tween: @tween)
      end

      def draw
        Gosu.draw_circle(@position.x, @position.y, @radius, @points, @color, ZOrder::STAR, :add)
      end

      def update(dt)
        @color = @animator.color_transition

        return unless @animator.complete?

        # Invert animator color tween

        if @color == @white_color
          @animator = CyberarmEngine::Animator.new(start_time: Gosu.milliseconds, duration: @duration, from: @white_color, to: @store_color, tween: @tween)
        elsif @color == @store_color
          @animator = CyberarmEngine::Animator.new(start_time: Gosu.milliseconds, duration: @duration, from: @store_color, to: @white_color, tween: @tween)
        end
      end
    end
  end
end
