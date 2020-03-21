class Artist
  attr_accessor :name, :genres
  attr_reader :songs
  extend Concerns::Findable

  @@all=[]

  def initialize(name= nil)
    @name=name
    @songs=[]
  end

  def save
    @@all << self
  end

  def self.create(artist_name)
    new_artist = Artist.new(artist_name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song) #add current artist to Song artist property
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end



end
