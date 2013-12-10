require 'bundler'
Bundler.require
require './lib/parser'

module Playlister
  class Playlist < Sinatra::Application
    
    get '/hi' do
      "test"
      erb :artists
    end

    get '/artist' do
      parse = Parser.new
      @artists = parse.get_artists
      erb :artists
      
    end
  end
end