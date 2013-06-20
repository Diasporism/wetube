module TimeHelper
  def convert_seconds_to_time(seconds)
    total_minutes = seconds / 1.minutes
    seconds_in_last_minute = seconds - total_minutes.minutes.seconds
    if seconds_in_last_minute > 10
      "#{total_minutes}:#{seconds_in_last_minute}"
    else
      "#{total_minutes}:0#{seconds_in_last_minute}"
    end
  end
end
