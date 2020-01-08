#Want to be able to persist Character objects onto an array

class Character
  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :homeworld

  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |key, val|
      #Prevent calling a method that doesn't exist (i.e., we didn't)
      #build an attr_accessor for 
      self.send("#{key}=", val) if self.respond_to?("#{key}=")
    end #each
    self.save
  end #init

  def save
    @@all << self
  end 

  def self.all
    @@all
  end 

end #class