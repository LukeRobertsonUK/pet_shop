require 'pry'

require_relative 'client'
require_relative 'animal'
require_relative 'shelter'

#initialize our store
hq = Shelter.new("Headquarters", "55 Clapham High Street")

#initialize existing clients
people = [
  Client.new("Luke", 35, :male, 1),
  Client.new("Fred", 22, :male, 1),
  Client.new("Wilma", 45, :female, 0),
  Client.new("Tracy", 37, :female, 0),
  Client.new("Brian", 19, :male, 2),
  Client.new("Betty", 25, :female, 1)
    ]

#populating client list
people.each do |person|
  hq.clients[person.name] = person
end

#initializing existing pets
hq.clients["Luke"].pets["Olaff"] = Animal.new("Olaff", "Poodle", 2, :male, "rubber duck")
hq.clients["Betty"].pets["Bernie"] = Animal.new("Bernie", "Bulldog", 3, :male, "toy sheep")

#initialize existing inventory
animals = [
  Animal.new("Woofer", "German Shepheard", 3, :male, "rubber duck"),
  Animal.new("Bilbo", "Parson Russell", 1, :male, "tennis ball"),
  Animal.new("K-9", "Yorkshire Terrier", 2, :female, "fake bone"),
  Animal.new("Fido", "Bull Terrier", 5, :male, "toy sheep"),
  Animal.new("Arnold", "Sheep Dog", 7, :male, "toy sheep"),
  Animal.new("Lassy", "Collie", 8, :female, "tennis ball"),
  Animal.new("TheLittlestHobo", "German Shepheard", 5, :male, "fake bone"),
  Animal.new("Mumrah The Ever Living", "Labradoodle", 1, :female, "tennis ball")
    ]

#filling inventory hash with the animals
animals.each do |animal|
  hq.inventory[animal.name] = animal
end

puts hq.clients.values.join(",\n")


#run the app
puts `clear`
puts "----------------------------------"
puts "ANIMAL SHELTER MANAGEMENT SYSTEM"
puts "----------------------------------"
puts "\nPlease select an option:"
puts "Get (C)lient Information"
puts "(A)dd A New Client"
puts "(D)isplay Current inventory"
puts "Check-(O)ut a Dog"
puts "Check-(I)n a Dog"
response = gets.chomp.downcase
case response
  when 'c'
    puts hq.clients.values.join("\n")
  when 'd'
    puts hq.inventory.values.join("\n")
  when 'o'
    hq.check_out
end









binding.pry