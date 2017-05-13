require 'time_difference'

class TimeStamp
  attr_reader :hour, :minute, :day, :month, :time

  def initialize(time_string = nil)
    time = time_string ? parse_time_string(time_string) : Time.now

    @hour = time.hour
    @minute = time.min
    @month, @day = time.month, time.day
    @time = time
  end

  def date
    @time.strftime("%Y-%m-%d")
  end

  def query_time
    @time.strftime("%k:%M").strip
  end

  def closest_of_two(timestamp_one, timestamp_two)
    one_difference = TimeDifference.between(@time, timestamp_one.time).in_seconds
    two_difference = TimeDifference.between(@time, timestamp_two.time).in_seconds
    return one_difference < two_difference ? timestamp_one : timestamp_two
  end

  protected :time

  private
    def parse_time_string(str)
      regex = /\A[0-2][1-9]\-[0-3][1-9]\-20[0-1][0-9]\s[0-2][0-9]:[0-6][0-9]:[0-6][0-9]\Z/
      raise "TimeStamp error: invalid timestamp string passed to #new"  if not regex.match(str)
      to_int = ->(str){str.to_i}
      year = /20[0-1][0-9]/.match(str)[0].to_i
      month, day = /\A[0-2][1-9]-[0-3][1-9]/.match(str)[0].split('-').map(&to_int)
      hour, minute, seconds = /[0-2][0-9]:[0-6][0-9]:[0-6][0-9]/.match(str)[0].split(':').map(&to_int)
      Time.new(year, month, day, hour, minute, seconds)
    end

end
