class Genre

  attr_accessor :name
  extend Concerns::Findable
  attr_reader :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create (name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def songs
    Song.all.each do |song|
      if song.genre == self
        @songs << self
      end
    end
    @songs
  end

  def artists
    @artist_array = []
    @songs.each do |song|
      if !@artist_array.include?(song.artist)
        @artist_array << song.artist
      end
    end
    @artist_array
  end




end
