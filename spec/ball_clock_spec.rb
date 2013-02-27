require 'minitest/spec'
require 'minitest/autorun'
require 'ball_clock'

describe BallClock do
  describe "#check_count!" do
    it "must raise an error when the ball count is too low" do
      lambda { BallClock.new.ball_cycle_length_for_count(26) }.must_raise BallClock::ArgumentError
    end

    it "must raise an error when the ball count is to high" do
      lambda { BallClock.new.ball_cycle_length_for_count(128) }.must_raise BallClock::ArgumentError
    end
  end

  describe "#ball_cycle_length_for_count" do
    it "should return the number of days for a given number of balls" do
      clock = BallClock.new
      clock.ball_cycle_length_for_count(30).must_equal 15
      clock.ball_cycle_length_for_count(45).must_equal 378
    end
  end
end
