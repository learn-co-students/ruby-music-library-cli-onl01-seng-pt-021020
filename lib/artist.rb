require 'pry'


class Artist
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
    artist = self.new(name)
    artist.save
    artist
  end
  
  
  # instance methods
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    song.artist = self if song.artist.nil? unless @songs.include?(song)
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
  
end