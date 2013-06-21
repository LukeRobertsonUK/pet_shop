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
    receiving_client = clients[client_name.downcase]
    pet = inventory.delete(pet_name.downcase)
    receiving_client.pets[pet_name.downcase] = pet
    puts "#{pet.name} now belongs to #{receiving_client.name}"
  end

end