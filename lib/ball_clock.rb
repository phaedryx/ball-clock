class BallClock
  class ArgumentError < StandardError; end

  def initialize()
  end

  def check_count!(count)
    raise ArgumentError, "ball count must be between 27 and 127" unless count >= 27 && count <= 127
  end

  def ball_cycle_length_for_count(count)
    check_count!(count)
    queue = Array.new(count) {|i| i+1 }
  end

  def tick(params={})
    queue             = params[:queue]
    minute_track      = params[:minute_track]
    five_minute_track = params[:five_minute_track]
    hour_track        = params[:hour_track]
    minutes           = params[:minutes]

    minutes += 1
    {queue: queue, minute_track: minute_track, five_minute_track: five_minute_track, hour_track: hour_track, minutes: minutes}
  end
end
