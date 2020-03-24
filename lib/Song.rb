class Song 
    extend Concerns::Findable 
    attr_accessor :name, :artist, :genre 
    @@all = []
    
    def initialize(name, artist_obj = nil, genre_obj = nil)
      @name = name 
      self.artist=(artist_obj) if artist_obj != nil
      self.genre=(genre_obj) if genre_obj != nil
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
    
    def self.create(name)
      song = self.new(name)
    end
    
    def artist=(artist_obj)
      @artist = artist_obj 
      artist.add_song(self)
    end 
    
    def genre=(genre_obj)
      @genre = genre_obj
      genre.songs << self unless genre.songs.include?(self)
    end 
    
    def self.new_from_filename(filename)
      array = filename.split(" - ")
  
      song_name = array[1]
      artist_name = array[0]
      genre_name = array[2].split(".mp3").join
  
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      Song.new(song_name, artist, genre)
    end 
    
    def self.create_from_filename(filename)
      self.new_from_filename(filename).save
    end 
    
    
end 