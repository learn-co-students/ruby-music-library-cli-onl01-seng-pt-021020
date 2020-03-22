class Artist 
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
  artist = Artist.new(song)
  self.all << self
  artist 
  end 
end 