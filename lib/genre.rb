class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all=[]

  def initialize(name= nil)
    @name=name
    @songs=[]
  end

  def save
    @@all << self
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end

end
