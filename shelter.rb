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

  def check_out(pet_name, client_name)
    pet = inventory.delete(pet_name.downcase)
    clients[client_name.downcase].pets[pet_name.downcase] = pet
    puts "#{pet_name} now belongs to #{client_name}"
  end


end