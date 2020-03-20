class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(artist)
    @name = artist
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

  def self.create(artists)
    artists = self.new(artists)
    self.all << artists
    artists
  end

  def add_song(song)
    unless song.artist = self
      songs << song
    else
      song.artist
    end
  end
end
