class MusicImporter

  def initialize(path)
    @path = path
  end

  def files

  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end


end
