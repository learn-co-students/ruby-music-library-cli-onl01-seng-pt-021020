class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

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
  genre = Genre.new(song)
  self.all << self
  genre
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

end
