require 'pry'

class Artist

  attr_accessor :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == self
    else
      song.artist = self
      @songs << song
    end
  end

  def genres
    self.songs.collect {|artist| artist.genre}.uniq
  end
end
