

class Artist 
  attr_accessor :name, :song 
  
  extend Concerns::Findable 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end 
  
  def save 
    @@all << self 
    # OR, self.class.all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(artist)
    artist = self.new(artist)
    #artist.save Commented this out to pass test 51.
    artist
  end 
  
  def songs
    @songs
  end 
  
  def add_song(song)
    song.artist == nil ? song.artist = self : nil 
    if @songs.include?(song) ? nil : @songs << song 
    end 
  end 
  
  
  
  def genres 
    Song.all.map {|song| song.genre}.uniq 
    
    #returns a collection of genres for all an artist's songs, an artist has many genres through songs. Does not return duplicate genres, used uniq here. Collects genres through its songs instead of maintainning its own @genres instance variable. 
  end 
  
end 
