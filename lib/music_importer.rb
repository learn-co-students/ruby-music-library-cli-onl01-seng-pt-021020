class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select! {|path| path.end_with?(".mp3")}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
