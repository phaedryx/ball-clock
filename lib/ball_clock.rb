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

  def tick(params={}) # takes a current clock state and returns the next clock state
    queue             = params[:queue]
    minute_track      = params[:minute_track]
    five_minute_track = params[:five_minute_track]
    hour_track        = params[:hour_track]
    minutes           = params[:minutes]

    # take the first ball from the queue
    curr_ball = queue.slice!(0)
    if minute_track.size < 4
      minute_track << curr_ball              # add the ball to the minute track if there is room
    else                                     # it continues if there isn't room
      queue += minute_track.reverse          # add the minute track back to the queue (reversed)
      minute_track.clear                     # empty the minute track
      if five_minute_track.size < 11
        five_minute_track << curr_ball       # add the ball to the five minute track if there is room
      else                                   # it continues if there isn't room
        queue += five_minute_track.reverse   # add the five minute track to the queue (reversed)
        five_minute_track.clear              # empty the five minute track
        if hour_track.size < 11
          hour_track << curr_ball            # add the ball to the hour track if there is room
        else                                 # it continues if there isn't room
          queue += hour_track.reverse        # add the hour track to the queue (reversed)
          hour_track.clear                   # empty the hour track
          queue << curr_ball                 # remember to add the current ball to the end of the queue
        end
      end
    end
    minutes += 1
    {queue: queue, minute_track: minute_track, five_minute_track: five_minute_track, hour_track: hour_track, minutes: minutes}
  end
end
