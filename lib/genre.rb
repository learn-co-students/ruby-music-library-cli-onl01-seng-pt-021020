class Genre
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(genre)
    @name = genre
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

  def self.create(genres)
    genres = self.new(genres)
    self.all << genres
    genres
  end
end
