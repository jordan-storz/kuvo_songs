require_relative './models/song'

class Controller
  def self.fetch_and_save_song
    kuvo_song = KuvoRequest.fetch_closest_song
    song_record = kuvo_song.to_song_record
    if song_record.save then
      [201]
    else
      [500]
    end
  end
end
