class Song 
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
  
  def self.create 
    self 
    save 
  end 
  
  def self.create(song)
  song = Song.new(song)
  self.all << self
  song 
  end 
end 