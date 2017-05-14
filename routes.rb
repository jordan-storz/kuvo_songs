require_relative 'controller'

post '/' do
  Controller.fetch_and_save_song
end
