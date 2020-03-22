require 'pry'

class Genre

    attr_accessor :name 
    extend Concerns::Findable
    
    @@all = []

    def initialize(name)
        @name = name
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

    def self.create(genre_name)
        created_genre = Genre.new(genre_name)
        created_genre.save
        created_genre
    end

    def songs
        @songs
    end

    def artists
       songs.collect {|song| song.artist}.uniq 
    end



end
