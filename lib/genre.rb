class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  
  #class variables
  @@all = []
  
  #class methods
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  
  # instance methods
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
  
end