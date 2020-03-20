class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(song, artist = nil)
    @name = song
    self.artist = artist if artist
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

  def self.create(songs)
    songs = self.new(songs)
    self.all << songs
    songs
  end
end
