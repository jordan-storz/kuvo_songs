
class TimeStamp
  attr_reader :hour, :minute, :day, :month
  def initialize(time_string)
    time = time_string ? parse_time_string(time_string) : Time.now
    @hour = time.hour
    @minute = time.min
    @month, @day = time.month, time.day
  end


  private
    def parse_time_string(str)
      regex = /\A[0-2][1-9]\-[0-3][1-9]\-20[0-1][0-9]\s[0-2][0-9]:[0-6][0-9]:[0-6][0-9]\Z/
      puts 'matches or not'
      puts regex.match(str)
      raise "TimeStamp error: invalid timestamp string passed to #new"  if not regex.match(str)
      to_int = ->(str){str.to_i}
      year = /20[0-1][0-9]/.match(str)[0].to_i
      month, day = /\A[0-2][1-9]-[0-3][1-9]/.match(str)[0].split('-').map(&to_int) 
      hour, minute, seconds = /[0-2][0-9]:[0-6][0-9]:[0-6][0-9]/.match(str)[0].split(':').map(&to_int)
      Time.new(year, month, day, hour, minute, seconds)
    end

end
