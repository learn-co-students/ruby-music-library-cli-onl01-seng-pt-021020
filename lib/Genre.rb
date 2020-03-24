class Genre 
    extend Concerns::Findable 
    attr_accessor :name 
    
    @@all = []
    
    def initialize(name)
      @name = name 
      @songs = []
      save 
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
      genre_name = Genre.new(genre_name)
      # genre_name.save
      # genre_name
    end 
    
    def songs 
      @songs 
    end 
    
    def artists
      @artist_array = []
      self.songs.each do |song|
        if @artist_array.include?(song.artist)
          nil
        else
          @artist_array << song.artist
        end
      end
      @artist_array
    end
end 