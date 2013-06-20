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



end