class Song
 @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil)
    @name = name
    @songs = []
    self.artist = artist if artist
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end



end
