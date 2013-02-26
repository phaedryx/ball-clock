class BallClock
  class FileError < StandardError; end

  def initialize(file)
    raise FileError, "expected File, received #{file.class} instead" unless file.is_a?(File)

  end
end
