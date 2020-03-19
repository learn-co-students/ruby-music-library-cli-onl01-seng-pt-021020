#To create this from the command line, type "mkdir lib/concerns"
#Then type "touch lib/concerns/findable.rb"

module Concerns::Findable 
  def find_by_name(name)
    all.find {|x| x.name == name}
  end 
  
  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end 
    
end 
