require 'pry'

class Artist

    attr_accessor :name, :songs 
    extend Concerns::Findable
    
    @@all = []

    def initialize(artist_name)
        @name = artist_name
        @songs = []
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

    def self.create(artist_name)
        created_artist = Artist.new(artist_name)
        created_artist.save
        created_artist
    end
    
    def add_song(song)
        song.artist == nil ? song.artist = self : nil
        @songs.include?(song) ? nil : @songs << song
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end
end