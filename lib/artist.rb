require 'pry'

class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !@songs.include?(song)
      self.songs << song
    end

  end

  def genres
    @genre_array = []
    @songs.each do |song|
      if !@genre_array.include?(song.genre)
        @genre_array << song.genre
      end
    end
    @genre_array
  end


end
