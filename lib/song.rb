class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  
  # class variables
  @@all = []
  
  # class methods
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song.nil?
      song = create(name)
    end
    song
  end
  
  def self.new_from_filename(filename)
    artist_name, song_name, genre = filename.split(' - ')
    genre = genre.split('.')[0]
    song = find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
  
  
  # instance methods
  def initialize(name, artist=nil, genre=nil)
    @name = name
    unless artist.nil?
      self.artist = artist
    end
    unless genre.nil?
      self.genre = genre
    end
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end
  
end