#To create this from the command line, type "// ♥ touch lib/music_importer.rb"
require 'pry'
class MusicImporter 
  
  attr_reader :path 
  #Accepts a file path to parse MP3 files from
  
  def initialize(path)
    @path = path
    #retrieves the path provided to the MusicImporter Object. 
    
  end 
  
  def files 
    Dir.glob("#{path}/*").map {|file| file.gsub("#{path}/", "")}
    
    #loads all MP3 files into the path directory
    #normalizes filename to just the MP3 filename with no path
  end 
  
  def import
    files.each do |file|
      Song.create_from_filename(file)
    end 
    #Imports the files into the library by invoking Song.create_from_filename
  end 
end 

