class MusicImporter

  attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller

  def initialize(path)
    @path = path
  end

  def files

  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end


end
