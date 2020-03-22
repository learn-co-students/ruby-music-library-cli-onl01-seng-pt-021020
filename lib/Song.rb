require 'pry'

class Song

    
    attr_accessor :name, :artist 

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        self.artist = artist unless artist == nil
        #binding.pry 
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self 
    end

    def self.create(song_name)
        created_song = Song.new(song_name)
        created_song.save
        created_song
    end
end
