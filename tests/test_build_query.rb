require 'minitest/autorun'
require_relative '../helpers/build_query.rb'
require_relative '../helpers/time_stamp'


class QueryBuilder_Test < MiniTest::Test
  def setup
    @query_builder = QueryBuilder.new
  end

  def test_new
    assert_equal @query_builder.instance_of?(QueryBuilder), true
  end

  def test_make_url_exists
    refute_nil(@query_builder.make_url)
    assert_equal @query_builder.make_url.instance_of?(String), true
  end

  def test_make_url_correct
    'https://api.composer.nprstations.org/v1/widget/5193f157e1c87ce8d991ab20/playlist?t=1494345264223&datestamp=2017-05-08&order=1&time=5%3A00'
    actual_url_string = @query_builder.make_url
    assert_match(/^[^&]*&[^&]*&[^&]*&[^&]*/, actual_url_string)
    assert_includes(actual_url_string, 'https://api.composer.nprstations.org/v1/widget/5193f157e1c87ce8d991ab20/playlist')
    assert_match(/playlist?t=1494345264223/, actual_url_string)
    assert_match(/datestamp=2017-[0-1][0-9]-[0-3][0-9]/, actual_url_string)
    assert_match(/order=1/, actual_url_string)
    assert_match(/time=[0-1]*[0-9]%3A[0-6][0-9]/, actual_url_string)
  end

end
