require 'minitest/spec'
require 'minitest/autorun'
require 'ball_clock'

describe BallClock do
  describe "#initialize" do
    it "must raise an error when not provided with a file" do
      -> { BallClock.new("not a file") }.must_raise BallClock::FileError
    end
  end
end
