class BallClock
  class ArgumentError < StandardError; end

  def initialize()
    @ball_counts = []
  end

  def check_count!(count)
    raise ArgumentError, "ball count must be between 27 and 127" unless count >= 27 && count <= 127
  end

  def ball_cycle_length_for_count(count)
    check_count!(count)
  end
end
