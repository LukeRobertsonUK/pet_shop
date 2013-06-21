require 'pry'

require_relative 'client'
require_relative 'animal'
require_relative 'shelter'

#initialize existing objects
hq = Shelter.new("Headquarters", "55 Clapham High Street")

people = [
  Client.new("Luke", 35, :male, 1),
  Client.new("Fred", 22, :male, 1),
  Client.new("Wilma", 45, :female, 0),
  Client.new("Tracy", 37, :female, 0),
  Client.new("Brian", 19, :male, 2),
  Client.new("Betty", 25, :female, 1)
    ]

people.each do |person|
  hq.clients[person.name.downcase] = person
end

hq.clients["luke"].pets["olaff"] = Animal.new("Olaff", "Poodle", 2, :male, "rubber duck")
hq.clients["betty"].pets["bernie"] = Animal.new("Bernie", "Bulldog", 3, :male, "toy sheep")

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

animals.each do |animal|
  hq.inventory[animal.name.downcase] = animal
end

def add_dog(branch_or_client)
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
  branch_or_client.dog_adder(Animal.new(n, b, a, s, t))
end

#run the app

condition = true
while condition
  puts `clear`
  puts "----------------------------------"
  puts "ANIMAL SHELTER MANAGEMENT SYSTEM"
  puts "----------------------------------"
  puts "\nPlease select an option:"
  puts "Get (c)lient information"
  puts "(A)dd a new client"
  puts "(D)isplay current inventory"
  puts "Check-(o)ut a dog"
  puts "Check-(i)n a dog"
  puts "(V)iew dogs on file for a particular client"
  puts "Add a new dog to (r)ecords"
  response = gets.chomp.downcase
  case response
  when 'c'
      hq.list_clients
  when 'a'
     hq.new_client_record
  when 'd'
      hq.display_inventory
  when 'o'
      hq.check_out
  when 'i'
      hq.list_clients
      puts "\nWho is checking-in the animal?"
      seller = hq.clients[gets.chomp.downcase.to_s]
      seller.give_up(hq)
      hq.display_inventory
  when 'v'
      hq.list_clients
      puts "\nWhose pets would you like to see?"
      hq.clients[gets.chomp.downcase.to_s].display_pets
  when 'r'
      puts "Add to (i)nventory or a (c)lient?"
      response = gets.chomp.downcase
      if response == "i"
        add_dog(hq)
      else
        puts "\nOK, which client?"
        hq.list_clients
        add_dog(hq.clients[gets.chomp.downcase.to_s])
      end
  end
  puts "\nWould you like to run the program again or (q)uit?"
  condition = false if gets.chomp.downcase == "q"
end




