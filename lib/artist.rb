class Artist
  attr_accessor :name, :genres
  attr_reader :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name=nil)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def genres 
    songs.collect{|song| song.genre}.uniq 
  end
  
    
end