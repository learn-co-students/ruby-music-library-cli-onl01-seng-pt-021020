class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.entries(@path).select{|file| file.include?(".mp3")}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
