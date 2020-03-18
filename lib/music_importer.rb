class MusicImporter
    attr_reader :path
    def initialize(path)
        @path = path
    end
    def files
        file = Dir.entries(self.path).select{|file|file.include?("mp3")}
        file
    end
    def import
        self.files.each{|file| Song.create_from_filename(file)}
    end
end
