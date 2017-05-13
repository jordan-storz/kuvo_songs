require 'test/unit'
require_relative '../helpers/time_stamp.rb'

class TimeStamp_Test < Test::Unit::TestCase
  def test_invalid_new
    bad_strings = ['bad string', '', '3-7-2017 05:03:30']
    bad_strings.each do |bad_string|
      assert_raise {TimeStamp.new(bad_string)}
    end
  end

  def test_valid_new
    good_string = '03-07-2017 05:03:30'
    timestamp = TimeStamp.new(good_string)
    assert_equal(timestamp.hour, 5)
    assert_equal(timestamp.minute, 3)
    assert_equal(timestamp.day, 7)
    assert_equal(timestamp.month, 3)
  end
end 


