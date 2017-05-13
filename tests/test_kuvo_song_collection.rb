require 'minitest/autorun'
require 'minitest/unit'
require_relative '../helpers/kuvo_song'
require_relative '../helpers/kuvo_song_collection'

class KuvoSongCollection_Test < MiniTest::Test

  def setup
    @valid_kuvo_song = KuvoSong.new(
      "_start_time" => "05-08-2017 12:10:52",
      "trackName"   => "So What",
      "artistName"  => "Miles Davis",
      "collectionName" => "Kind of Blue"
    )
  end

  def test_array_constructor
    invalid_inputs = [
      [@valid_kuvo_song, @valid_kuvo_song.dup, 'yo'],
      [1, 2, 3],
      [true, @valid_kuvo_song]
    ]
    invalid_inputs.each do |invalid_array|
      assert_raises { KuvoSongCollection.new(invalid_array) }
    end
  end

  def test_valid_input
    valid_input = [@valid_kuvo_song, @valid_kuvo_song.dup]
    kuvo_collection = KuvoSongCollection.new(valid_input)
    assert(kuvo_collection.instance_of?(KuvoSongCollection))
    assert(kuvo_collection.length == 2)
  end

  def test_closest_to_time
    inputs = [
      KuvoSong.new(
        "_start_time" => "05-08-2017 12:10:52",
        "trackName"   => "So What",
        "artistName"  => "Miles Davis",
        "collectionName" => "Kind of Blue"
      ),
      KuvoSong.new(
        "_start_time" => "05-08-2017 12:15:52",
        "trackName"   => "Blue and Green",
        "artistName"  => "Miles Davis",
        "collectionName" => "Kind of Blue"
      ),
      KuvoSong.new(
        "_start_time" => "05-08-2017 12:17:52",
        "trackName"   => "Freddy Freeloader",
        "artistName"  => "Miles Davis",
        "collectionName" => "Kind of Blue"
      ),
    ]

    kuvo_collection = KuvoSongCollection.new(inputs)

    now_timestamp = TimeStamp.new("05-08-2017 12:18:50")
    closest_song_to_now = kuvo_collection.closest_to_time(now_timestamp)
    assert(closest_song_to_now == inputs[2])
  end

end
