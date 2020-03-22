
class MusicImporter

    attr_accessor :path
    
    def initialize(path)
        @path = path 
    end

    def files
        Dir.entries(@path).select {|x| x.include?(".mp3")}
    end
  
end