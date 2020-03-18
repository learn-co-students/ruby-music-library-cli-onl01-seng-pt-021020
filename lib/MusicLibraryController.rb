class MusicLibraryController
    attr_reader :path
    def initialize(path = "./db/mp3s")
        new_import = MusicImporter.new(path)
        new_import.import
    end
    def call
        entry = ""
        while entry != "exit" do
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            entry = gets.strip
            case entry
                when    "list songs"
                    list_songs
                when    "list artists"
                    list_artists
                when    "list genres"
                    list_genres
                when    "list artist"
                    list_songs_by_artist
                when    "list genre"
                    list_songs_by_genre
                when    "play song"
                    play_song
                else    "exit"
            end
        end
    end
    def list_songs
        num = 0
        while num < Song.all.length do
            puts "#{num + 1}. #{Song.all[num].artist.name} - #{Song.all[num].name} - #{Song.all[num].genre.name}"
            num += 1
        end
    end
    def play_song
        puts "Which song number would you like to play?"
        num = gets.to_i
        if num > 0 && num.class == Integer && num < Song.all.length
            puts "Playing #{Song.all[num - 1].name} by #{Song.all[num - 1].artist.name}"
        end
    end
    def list_artists
        num = 0
        while num < Artist.all.length do
            puts "#{num + 1}. #{Artist.all[num].name}"
            num += 1
        end
    end
    def list_genres
        num = 0
        while num < Genre.all.length do
            puts "#{num + 1}. #{Genre.all[num].name}"
            num += 1
        end
    end
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        name = gets.strip
        # Artist.find_by_name(name).songs.first.name
        if Artist.find_by_name(name) != nil
            name = Artist.find_by_name(name)
            name.songs.each.with_index do |song, i|
                puts "#{i + 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        name = gets.strip
        # Artist.find_by_name(name).songs.first.name
        if Genre.find_by_name(name) != nil
            name = Genre.find_by_name(name)
            name.songs.each.with_index do |song, i|
                puts "#{i + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end
end
