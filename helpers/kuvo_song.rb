require_relative './time_stamp'

class KuvoSong
  attr_reader :timestamp

  def initialize(props)

    validate_props(props)
    @timestamp = TimeStamp.new(props['_start_time'])
    @title  = props['trackName']
    @artist = props['artistName']
    @album  = props['collectionName']
  end

  def to_song_record
    Song.new(
      title: @title,
      artist: @artist,
      album: @album
    )
  end

  private
    def validate_props(props)
      raise_prop_error('_start_time') if props['_start_time'].nil?
      raise_prop_error('trackName') if props['trackName'].nil?
      raise_prop_error('artistName') if props['artistName'].nil?
    end

    def raise_prop_error(prop_name)
      raise("KuvoSong: '#{prop_name}' is a required input property to #new. double-check the json flow")
    end
end
