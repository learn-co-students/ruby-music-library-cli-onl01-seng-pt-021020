class Song
 @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @songs = []
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      nil
    else
      genre.songs << self
    end
  end




end
