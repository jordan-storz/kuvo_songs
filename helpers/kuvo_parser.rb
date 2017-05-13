require 'json'

class KuvoParser

  def self.extract_songs_info(json)
    show_playlist = extract_show_playlist(json)
    songs_info = show_playlist.collect do |show|
      show['playlist']
    end
    songs_info.flatten(1)
  end

  private

    def self.extract_show_playlist(json)
      playlist = JSON.parse(json)['playlist']
      return playlist || raise("KuvoParser: JSON object does not contain a 'playlist' property.")
    end
end
