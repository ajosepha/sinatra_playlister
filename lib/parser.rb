class Parser

    def initialize
        @artist
        @songs
        @catalogue = []
    end


    def parse_files
    files = Dir.entries('./public/data').select {|f| !File.directory? f} #don't want . and .. defaults to get pulled
    artist = /((.*) (?=\-))/
    song = /(?<=\-\s).*(?=\s\[)/
    genre = /(?<=\[).*(?=\])/
    #catalogue = []
    files.each do |item|
        song_array = []
        # we call strip b/c our regex results in some white space
        m = item.match(artist).to_s.strip
        z = item.match(song).to_s
        x = item.match(genre).to_s
        song_array << m << z << x
        @catalogue << song_array
        end
        @catalogue
    end

    def get_artists
        artist_list = []
        parse_files.each do |file|
            artist_list << file[0]
        end
        artist_list.uniq!
    end

    def get_songs
        song_list = []
        parse_files.each do |file|
            song_list << file[1]
        end
        song_list
    end

    def get_genres
        genre_list = []
        parse_files.each do |file|
            genre_list << file[2]
        end
        genre_list.uniq!
    end

end
# parse = Parser.new
# ap parse.get_genres