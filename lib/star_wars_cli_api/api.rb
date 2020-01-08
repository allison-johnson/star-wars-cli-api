require 'rest-client'
require 'json'
require 'pry'

#Use this when you're going to require a file relative to where you are in the directory
#Can use ./ since it's a sibling file
require_relative './character'

#We'll need to run gem install rest-client if that gem hasn't already been installed

#For my project, I want to do something with Star Wars characters
#Need to get base info about characters, which the Star Wars API has
#I will use the info to make Character objects and "persist" them into a 
#class variable

#getting the info...

response = RestClient.get("https://swapi.co/api/people")
#Returns RerstClient::Response object

characters_array = JSON.parse(response.body)["results"]
#Can then call response.body #=> something unusable
#JSON.parse(response.body) #=> something usable (a hash!)

characters_array.each do |character|
  Character.new(character)
end #each

binding.pry
puts "goodbye"