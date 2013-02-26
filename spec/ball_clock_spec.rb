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

    it "must add the first queue ball to the minute track if it isn't full" do
      clock = BallClock.new
      queue = Array.new(27) {|i| i+1 }
      minutes = 0
      results = clock.tick({queue: queue, minute_track: [], five_minute_track: [], hour_track: [], minutes: minutes})
      results[:minute_track].must_equal [1]
    end

    it "must empty the minute track into the queue and add the ball to the five minute track if the minute track is full" do
      clock = BallClock.new
      queue = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
      minute_track = [1, 2, 3, 4]
      minutes = 0
      results = clock.tick({queue: queue, minute_track: minute_track, five_minute_track: [], hour_track: [], minutes: minutes})
      results[:minute_track].must_be_empty
      results[:five_minute_track].must_equal [5]
    end
  end
end
