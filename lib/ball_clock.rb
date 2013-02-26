class BallClock
  class FileError < StandardError; end
  class ArgumentError < StandardError; end

  def initialize(file)
    raise FileError, "expected File, received #{file.class} instead" unless file.is_a?(File)
    @ball_counts = []
    file.each_line do |count|
      count = count.strip.to_i
      break if count.to_i == 0
      check_count!(count)
      @ball_counts << count
    end
  end

  def check_count!(count)
    raise ArgumentError, "ball count must be between 27 and 127" unless count >= 27 && count <= 127
  end
end
