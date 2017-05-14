require 'json'
require_relative './kuvo_song'
require_relative './kuvo_song_collection'

class KuvoParser

  def self.extract_songs_info(json)
    show_playlist = extract_show_playlist(json)
    songs_info = show_playlist.collect do |show|
      show['playlist']
    end
    json_songs = songs_info.flatten(1)
    kuvo_songs = json_songs.map { |json_song| KuvoSong.new(json_song) }
    KuvoSongCollection.new(kuvo_songs)
  end

  private

    def self.extract_show_playlist(json)
      if json.instance_of? Hash then
        playlist = json['playlist']
      else
        playlist = JSON.parse(json)['playlist']
      end
      playlist || raise("KuvoParser: JSON object does not contain a 'playlist' property.")
    end
end
