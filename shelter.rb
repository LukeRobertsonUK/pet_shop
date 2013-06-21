class Shelter
attr_accessor :name, :address, :inventory, :clients

  def initialize(name, address)
    @name = name
    @address = address
    @clients = {}
    @inventory = {}
  end

  def to_s
    "#{name} @ #{address} has #{inventory.size} animals needing new homes"
  end

  def list_clients
    puts "\n**** CLIENT LIST****"
    puts clients.values.join("\n")
  end

  def display_inventory
    puts "\n****INVENTORY****"
    puts inventory.values.join("\n")
  end

  def check_out
    list_clients
    puts "\nWho is checking-out the animal?"
    buyer = gets.chomp.downcase.to_s
    display_inventory
    puts "\nWhich dog would you like to check-out?"
    pet = inventory.delete(gets.chomp.downcase)
    clients[buyer].pets[pet.name.downcase] = pet
    puts "\n#{pet.name.capitalize} now belongs to #{buyer.capitalize}"
    display_inventory
  end

  def new_client_record
    puts "What is the client's name?"
    n = gets.chomp.to_s
    puts "what is the client's age?"
    a = gets.chomp.to_i
    puts "what is the client's sex?"
    s = gets.chomp.to_sym
    clients[n.downcase] = Client.new(n, a, s)
    puts "#{n} has been added to the client list for #{self.name}."
  end

  def dog_adder(new_dog)
    inventory[new_dog.name.downcase] = new_dog
    puts "#{new_dog.name} has been added to inventory for #{self.name}."
    puts inventory.values.join("\n")
  end

end