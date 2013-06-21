
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
