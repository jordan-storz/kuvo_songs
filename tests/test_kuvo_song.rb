require 'minitest/autorun'
require 'minitest/unit'
require_relative '../helpers/kuvo_song'

class KuvoSong_Test < MiniTest::Test

  def test_invalid_props
    invalid_props = {
      "_start_time" => "05-08-2017 12:10:52"
    }
    assert_raises do
      KuvoSong.new(invalid_props)
    end
  end

  def test_valid_props
    props = {
      "_start_time" => "05-08-2017 12:10:52",
      "trackname"   => "So What",
      "artistName"  => "Miles Davis",
      "collectionName" => "Kind of Blue"
    }
    assert(KuvoSong.new(props).instance_of?(KuvoSong))
  end
end
