class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = Array.new
    def initialize(name)
        @name = name
        @songs = Array.new
        save
    end
    def self.all
        @@all.sort_by {|obj| obj.name}
    end
    def self.destroy_all
        @@all.clear
    end
    def save
        @@all << self
    end
    def songs
        @songs = @songs.sort_by {|obj| obj.name}
    end
    def artists
        self.songs.collect{|song| song.artist}.uniq
    end
end
