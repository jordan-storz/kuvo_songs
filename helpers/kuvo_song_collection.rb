require 'forwardable'
require_relative './kuvo_song'

class KuvoSongCollection

  extend Forwardable
  delegate [:select, :length, :collect] => :@collection

  def initialize(song_array)
    validate_input(song_array)
    @collection = song_array
  end

  def closest_to_time(timestamp)
    @collection.inject do |result, kuvo_song|
      # timestamp.closest_of_two(result, kuvo_song)
    end
  end


  private
    def validate_input(song_array)
      all_kuvo_songs = song_array.all? { |item| item.instance_of? KuvoSong }
      return all_kuvo_songs ||
             raise("KuvoSongCollection: all items in input must be instance of KuvoSong")
    end

end
