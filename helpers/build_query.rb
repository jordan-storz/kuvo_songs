require 'open-uri'
require_relative './time_stamp'

class QueryBuilder
  root_url = "https://api.composer.nprstations.org/v1/widget/5193f157e1c87ce8d991ab20/"
  def initialize(timestamp = 'test')
    @timestamp = timestamp
  end

  def self.now
    self.new
  end
  
  private
end
