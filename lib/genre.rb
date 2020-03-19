
class Genre 
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(genre)
    genre = self.new(genre)
    #genre.save Commented this out to pass test 51.
    genre
  end 
  
  def artists 
    Song.all.map {|song| song.artist}.uniq 
  end 
end 
