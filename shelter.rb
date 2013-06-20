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


  def check_out
    puts "What is your name?"
    if clients.keys.include?(gets.chomp.downcase)
      customer = gets.chomp.downcase
      puts "You are #{clients[customer]}"
    end
  end



end
