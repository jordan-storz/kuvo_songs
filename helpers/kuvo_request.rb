require 'HTTParty'
require_relative 'build_query'
require_relative 'kuvo_parser'

class KuvoRequest

  def self.fetch_closest_song
    query = QueryBuilder.new
    url = query.make_url
    response = HTTParty.get(url)
    json = response.parsed_response
    kuvo_songs = KuvoParser.extract_songs_info(json)
    song = kuvo_songs.closest_to_time(query.timestamp)
    song
  end
end
