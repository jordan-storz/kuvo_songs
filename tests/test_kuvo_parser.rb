require 'minitest/autorun'
require_relative '../helpers/kuvo_parser'

class KuvoParser_Test < MiniTest::Test

  def test_invalid_json
    bad_json = '"data": "{"greeting": "hello"}"'
    assert_raises do
      KuvoParser.extract_songs_info(bad_json)
    end
  end

  def test_valid_json
    file = File.open(File.dirname(__FILE__) + "/valid.json", "rb")
    valid_json = file.read
    songs_info = KuvoParser.extract_songs_info(valid_json)
    assert_equal(songs_info.length, 50)
  end

end
