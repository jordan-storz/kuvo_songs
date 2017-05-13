require 'minitest/autorun'
require_relative '../helpers/time_stamp.rb'

class TimeStamp_Test < MiniTest::Test
  def test_invalid_new
    bad_strings = ['bad string', '', '3-7-2017 05:03:30']
    bad_strings.each do |bad_string|
      assert_raises {TimeStamp.new(bad_string)}
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

  def test_date
    date_string = '03-07-2017 05:03:30'
    timestamp = TimeStamp.new(date_string)
    expected = '2017-03-07'
    assert_equal(expected, timestamp.date)
  end

  def test_time
    date_string = '03-07-2017 05:03:30'
    timestamp = TimeStamp.new(date_string)
    expected = "5:03"
    assert_equal(expected, timestamp.query_time)
  end

  def test_closest_of_two
    test_timestamp = TimeStamp.new('03-07-2017 05:03:30')

    timestamp_one  = TimeStamp.new('03-07-2017 05:04:30')
    timestamp_two  = TimeStamp.new('03-07-2017 05:05:30')
    assert test_timestamp.closest_of_two(timestamp_one, timestamp_two) == timestamp_one

    timestamp_one  = TimeStamp.new('03-07-2017 05:02:50')
    timestamp_two  = TimeStamp.new('03-07-2017 05:04:49')
    assert test_timestamp.closest_of_two(timestamp_one, timestamp_two) == timestamp_one

    timestamp_one  = TimeStamp.new('03-07-2017 05:07:50')
    timestamp_two  = TimeStamp.new('03-07-2017 05:09:49')
    assert test_timestamp.closest_of_two(timestamp_one, timestamp_two) == timestamp_one

    test_timestamp = TimeStamp.new('05-08-2017 12:18:00')
    timestamp_one  = TimeStamp.new('05-08-2017 12:17:52')
    timestamp_two  = TimeStamp.new('05-08-2017 12:15:52')
    assert test_timestamp.closest_of_two(timestamp_one, timestamp_two) == timestamp_one
  end
end
