class Song
 @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist)
    @name = name
    @artist = artist
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

  def self.create
    self
    save
  end

  def self.create(song)
  song = Song.new(song)
  self.all << self
  song
  end

  def find_by_name

  end

  def find_or_create

  end
end
