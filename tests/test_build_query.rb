require 'test/unit'
require_relative '../helpers/build_query.rb'
require_relative '../helpers/time_stamp'


class QueryBuilder_Test < Test::Unit::TestCase
  def setup
  end

  def test_now
    query_builder = QueryBuilder.now
    assert_equal query_builder.instance_of?(QueryBuilder), true
  end

end
