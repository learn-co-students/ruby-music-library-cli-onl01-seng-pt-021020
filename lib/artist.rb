class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :musiclibrarycontroller, :musicimporter
  
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
  
  def self.create(name)
    Artist.new(name)
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
      self.song = song
    end
    if @songs.none? {|element| element == song}
      @songs << song
    end
  end
  
  def genres 
    genres = []
    self.songs.each do |song|
      if self == song.artist
        genres << song.genre 
      end
    end
    genres.uniq
  end
        
      
end