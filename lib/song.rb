require 'pry' 

class Song 
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil 
    self.genre = genre unless genre == nil 
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
  
  def self.create(name)
    song = self.new(name)
    #song.save Commented this out to pass test 51.
    song
  end 
  
  def artist=(artist)
    @artist = artist #custom constructor 
    artist.add_song(self) #adds self, or a song, to artist's collection of songs. Artist has many songs. 
  end 
  
  def genre=(genre)
    #self is an instance of Song 
    #Add self to all the songs in this genre unless it's already there. 
    
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
  
  def self.new_from_filename(name)
    name_wout_mp3 = name.chomp(".mp3")
    artist, song, genre = name_wout_mp3.split(" - ")
    
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    
    new(song, artist, genre)
  end 
  
  #name looks like this: Action Bronson - Larry Csonka - indie.mp3

  def self.create_from_filename(name)
    new_from_filename(name).save 
    #initialized and saves a song based on the passed-in filename)
  end 
    
  
end 
