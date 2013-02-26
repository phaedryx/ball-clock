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
end
