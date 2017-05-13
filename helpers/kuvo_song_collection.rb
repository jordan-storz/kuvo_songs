require_relative './kuvo_song'

class KuvoSongCollection

  def initialize(song_array)
    validate_input(song_array)
    @collection = song_array
  end


  private
    def validate_input(song_array)
      all_songs = song_array.all? { |item| item.instance_of? KuvoSong }
      return all_songs || raise("KuvoSongCollection: all items in input must be instance of KuvoSong")
    end

end
