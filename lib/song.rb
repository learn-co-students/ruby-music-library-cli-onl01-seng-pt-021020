class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre
    @@all = Array.new
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.genre = genre
        self.artist = artist
        save
    end
    def self.all
        @@all.sort_by {|obj| obj.name}
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        @@all << self
    end
    def artist=(artist)
        @artist = artist
        if artist.class == Artist
            artist.add_song(self)
        end
    end
    def genre=(genre)
        @genre = genre
        if genre.class == Genre
            if !(genre.songs.include?(self))
                genre.songs << self
            end
        end
    end
    def self.new_from_filename(file_name)
        artist_name = file_name.split(" - ")[0]
        song_name = file_name.split(" - ")[1]
        genre_name = file_name.split(" - ")[2].gsub(".mp3", "")
        new_artist = Artist.find_or_create_by_name(artist_name)
        new_genre = Genre.find_or_create_by_name(genre_name)
        new_song = Song.new(song_name, new_artist, new_genre)
        new_song
    end
    def self.create_from_filename(file_name)
        self.new_from_filename(file_name)
    end
end
