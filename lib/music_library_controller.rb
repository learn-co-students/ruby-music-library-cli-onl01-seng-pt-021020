class MusicLibraryController

  attr_accessor :paths

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

end
