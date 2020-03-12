require 'pry'


class MusicLibraryController
  attr_reader :path
  
  
  def initialize(path='./db/mp3s')
    @path = path
    
    mi = MusicImporter.new(path)
    mi.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    
    puts "What would you like to do?"
    input = gets.chomp
    
    while input != 'exit' do
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist(input)
      when 'list genre'
        list_songs_by_genre(input)
      when 'play song'
        play_song
      end
      
      puts "What would you like to do?"
      input = gets.chomp
    end
  end
  
  def list_songs
    songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
    songs.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    artists = Artist.all.sort {|artist_a, artist_b| artist_a.name <=> artist_b.name}
    artists.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
  end
  
  def list_genres
    genres = Genre.all.sort {|genre_a, genre_b| genre_a.name <=> genre_b.name}
    genres.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    songs = Song.all.select {|song| song.artist.name == artist_name}
    songs.sort! {|song_a, song_b| song_a.name <=> song_b.name}
    songs_arr = []
    songs.each_with_index {|song, i| songs_arr << "#{i + 1}. #{song.name} - #{song.genre.name}"}
    if songs_arr.length > 0
      songs_arr.each {|song| puts song}
    end
    songs
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    songs = Song.all.select {|song| song.genre.name == genre_name}
    songs.sort! {|song_a, song_b| song_a.name <=> song_b.name}
    songs_arr = []
    songs.each_with_index {|song, i| songs_arr << "#{i + 1}. #{song.artist.name} - #{song.name}"}
    if songs_arr.length > 0
      songs_arr.each {|song| puts song}
    end
    songs
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
    song_choice = gets.chomp.to_i
    if song_choice > 0
      song = songs[song_choice - 1]
      unless song.nil?
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
  
end