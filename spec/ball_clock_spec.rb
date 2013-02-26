require 'minitest/spec'
require 'minitest/autorun'
require 'ball_clock'

describe BallClock do
  describe "#initialize" do
    it "must raise an error when not provided with a file" do
      -> { BallClock.new("not a file") }.must_raise BallClock::FileError
    end
  end

  describe "#check_count!" do
    it "must raise an error when the ball count is too low" do
      file = File.open("#{Dir.pwd}/spec/test_data/too_low.txt")
      -> { BallClock.new(file) }.must_raise BallClock::ArgumentError
    end

    it "must raise an error when the ball count is to high" do
      file = File.open("#{Dir.pwd}/spec/test_data/too_high.txt")
      -> { BallClock.new(file) }.must_raise BallClock::ArgumentError
    end
  end
end
