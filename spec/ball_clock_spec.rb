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

  describe "#tick" do
    it "must increase minutes by 1 for each tick" do
      clock = BallClock.new
      queue = Array.new(27) {|i| i+1 }
      minutes = 0
      results = clock.tick({queue: queue, minute_track: [], five_minute_track: [], hour_track: [], minutes: minutes})
      results[:minutes].must_equal minutes + 1
    end
  end
end
