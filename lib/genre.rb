class Genre 
  
  @@all = []
  
  attr_accessor :name 
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(song)
  genre = Genre.new(song)
  self.all << self
  genre 
  end 
end 