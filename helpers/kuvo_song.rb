require_relative './time_stamp'

class KuvoSong

  def initialize(props)
    validate_props(props)
    @timestamp = TimeStamp.new(props['_start_time']) ||
    @title  = props['trackname']
    @artist = props['artistName']
    @album  = props['collectionName']
  end

  private
    def validate_props(props)
      raise_prop_error('_start_time') if props['_start_time'].nil?
      raise_prop_error('trackname') if props['trackname'].nil?
      raise_prop_error('artistName') if props['artistName'].nil?
      raise_prop_error('collectionName') if props['collectionName'].nil?
    end

    def raise_prop_error(prop_name)
      raise("KuvoSong: '#{prop_name}' is a required input property to #new. double-check the json flow")
    end
end
