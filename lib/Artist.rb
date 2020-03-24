class Artist 
    extend Concerns::Findable 
    attr_accessor :name, :song  
    
    @@all = []
    
    def initialize(name)
      @name = name 
      save 
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
      artist_name = Artist.new(artist_name)
    end 
    
    def songs 
      @songs
    end 
    
    def add_song(new_song)
      if new_song.artist == nil
        new_song.artist = self
      else
        nil
      end
      if @songs.include?(new_song)
        nil
      else
        @songs << new_song
      end
      new_song
    end
    
    def genres 
      @genre_array = []
      self.songs.each do |song|
        if @genre_array.include?(song.genre)
          nil 
        else 
          @genre_array << song.genre 
        end 
      end 
      @genre_array
    end 
    
end 