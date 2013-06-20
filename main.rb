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
  hq.clients[person.name.downcase] = person
end

#initializing existing pets
hq.clients["luke"].pets["olaff"] = Animal.new("Olaff", "Poodle", 2, :male, "rubber duck")
hq.clients["betty"].pets["bernie"] = Animal.new("Bernie", "Bulldog", 3, :male, "toy sheep")

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
  hq.inventory[animal.name.downcase] = animal
end

def add_new_client(object)
  puts "What is the client's name?"
  n = gets.chomp.to_s
  puts "what is the client's age?"
  a = gets.chomp.to_i
  puts "what is the client's sex?"
  s = gets.chomp.to_sym
  new_person = Client.new(n, a, s)
  object[new_person.name.downcase] = new_person
  puts "You added #{new_person.name} to your client list."
  puts object.values.join("\n")
end


def check_out(stock, person)
  puts "Which of the following would you like to check-out?"
  puts "-----------------------------------------"
  puts stock.values.join("\n")
  puts "-----------------------------------------"
  response = gets.chomp.downcase
  person.pets[response] = stock[response]
  stock.delete(response)
  puts "\n#{response} now belongs to #{person.name}!"
end

def check_in(stock, person, new_home)
  puts "Which of the following would you like to check-in?"
  puts "-----------------------------------------"
  puts stock.values.join("\n")
  puts "-----------------------------------------"
  response = gets.chomp.downcase
  new_home[response] = stock[response]
  stock.delete(response)
  puts "\n#{response} has been added to inventory..."
end

def dog_adder(stock, customers)
  puts "What's the dog called?"
  n = gets.chomp.downcase.to_s
  puts "What breed is it?"
  b = gets.chomp.downcase.to_s
  puts "How old is it?"
  a= gets.chomp.downcase.to_i
  puts "What sex is it?"
  s = gets.chomp.downcase.to_sym
  puts "And what's it's favourite toy?"
  t = gets.chomp.downcase.to_s
  new_dog = Animal.new(n, b, a, s, t)
  puts "Add to (i)nventory or a (c)lient?"
  response = gets.chomp.downcase
  if response == "i"
    stock[new_dog.name.downcase] = new_dog
    puts "#{new_dog.name} has been added to inventory..."
    puts stock.values.join("\n")
  else
    puts customers.values.join("\n")
    puts "Which client?"
    answer = gets.chomp.downcase.to_s
    customers[answer].pets[new_dog.name.downcase] = new_dog
    puts "#{new_dog.name} has been added to our records for #{answer}."
  end
 end

#run the app

condition = true
while condition
  puts `clear`
  puts "----------------------------------"
  puts "ANIMAL SHELTER MANAGEMENT SYSTEM"
  puts "----------------------------------"
  puts "\nPlease select an option:"
  puts "Get (C)lient information"
  puts "(A)dd a new client"
  puts "(D)isplay current inventory"
  puts "Check-(o)ut a dog"
  puts "Check-(i)n a dog"
  puts "(V)iew dogs on file for a particular client"
  puts "Add a new dog to (r)ecords"
  response = gets.chomp.downcase
  case response
   when 'c'
      puts hq.clients.values.join("\n")
    when 'a'
     add_new_client(hq.clients)
    when 'd'
      puts hq.inventory.values.join("\n")
    when 'o'
      puts hq.clients.values.join("\n")
      puts "\nWho is checking-out the animal?"
      buyer = gets.chomp.downcase.to_s
      check_out(hq.inventory, hq.clients[buyer])
      puts "\nNew inventory..."
      puts hq.inventory.values.join("\n")
    when 'i'
      puts hq.clients.values.join("\n")
      puts "\nwho is checking-in the animal?"
      seller = gets.chomp.downcase.to_s
      check_in(hq.clients[seller].pets, hq.clients[seller], hq.inventory)
      puts hq.inventory.values.join("\n")
    when 'v'
      puts hq.clients.values.join("\n")
      puts "\nWho's pets would you like to see?"
      view = gets.chomp.downcase
      puts hq.clients[view].pets.values.join("\n")
    when 'r'
      dog_adder(hq.inventory, hq.clients)
  end
  puts "\nWould you like to run the program again or (q)uit?"
  condition = false if gets.chomp.downcase == "q"
end




