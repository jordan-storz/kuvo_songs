require 'uri'
require 'uri/common'
require_relative './time_stamp'

class QueryBuilder

  def initialize
    @timestamp = TimeStamp.new
    datestamp = @timestamp.date
    time = @timestamp.time

    @query_params = {
      t: '1494345264223',
      datestamp: datestamp,
      order: 1,
      time: time
    }
  end

  def make_url
    query_string = URI.encode_www_form(@query_params)
    URI.encode(ROOT_URL + query_string).sub("%253A", "%3A")
  end

  private
    ROOT_URL =
      "https://api.composer.nprstations.org/v1/widget/5193f157e1c87ce8d991ab20/playlist"


end
