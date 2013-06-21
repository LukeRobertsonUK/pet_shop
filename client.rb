class Client
  attr_accessor :name, :age, :sex, :num_kids, :pets

  def initialize(name, age, sex, num_kids = nil)
    @name = name
    @age = age
    @sex = sex
    @num_kids = num_kids
    @pets= {}
  end

  def to_s
    "name = #{name}; age = #{age}; sex = #{sex}; children = #{num_kids}; pets = #{pets.size}."
  end

  def display_pets
    puts pets.values.join("\n")
  end

  def give_up(shelter)
    display_pets
    puts "\nWhich pet would you like to check-in?"
    pet = pets.delete(gets.chomp.downcase)
    shelter.inventory[pet.name.downcase] = pet
    puts "#{pet.name} has been added to inventory for #{shelter.name}"
  end

  def dog_adder(new_dog)
    pets[new_dog.name.downcase] = new_dog
    puts "#{new_dog.name} has been added to #{self.name}'s pet list..."
    puts pets.values.join("\n")
  end

end