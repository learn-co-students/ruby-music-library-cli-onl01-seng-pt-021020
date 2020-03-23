class Artist 
  attr_accessor :name, :song 
  @@all = []
  extend Concerns::Findable
  
  
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
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist 
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  def genres 
    @arr = []
    @songs.each do |song|
      if @arr.include?(song.genre)
        nil
      else
        @arr << song.genre
      end
    end
    @arr
  end
  
      
  
 
  
end
