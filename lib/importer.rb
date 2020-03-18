require 'pry'
class MusicImporter
attr_reader :path

def initialize(path)
  @path = path
end

def files
Dir.entries(self.path).select {|file| file.include?("mp3") }
end

def import
  files.select {|file| Song.create_from_filename(file)}
end

end
