class Artist
 @@all = []

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
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

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
  end

end
