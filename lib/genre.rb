class Genre 
  extend Concerns::Findable
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  
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
    Genre.new(name)
  end
  
  def songs
    @songs
  end
  
  def artists
    array = []
    @songs.each do |song|
      if array.include?(song.artist)
        nil
      else
        array << song.artist
      end
    end
    array
  end
  
end