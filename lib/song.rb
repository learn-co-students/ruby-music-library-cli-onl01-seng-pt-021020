class Song
  extend Concerns::Findable
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
   @@all.detect do |song|
     song.name == name
   end
 end

 def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
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

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename.save
  end



end
