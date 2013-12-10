require 'bundler'
Bundler.require
require './lib/parser'

module Playlister
  class Playlist < Sinatra::Application
    parse = Parser.new

    get '/hi' do
      "test"
      erb :artists
    end

    get '/artist' do
      @artists = parse.get_artists
      erb :artists
    end

    # get '/artists/:task'
    #   if paramss

    # end

    get '/genres' do
      @genres = parse.get_genres
      erb :genres
    end

    get '/songs' do
      @songs = parse.get_songs
      erb :songs
    end

    get '/all' do
      @all = parse.parse_files
      erb :all
    end

  end
end