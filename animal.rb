class Animal

  attr_accessor :name, :breed, :age, :sex, :fav_toy

  def initialize(name, breed, age, sex, fav_toy)
    @name = name
    @breed = breed
    @age = age
    @sex = age
    @fav_toy = fav_toy
  end

  def to_s
    "#{name} / #{breed} is aged #{age} and loves a #{fav_toy}"
  end

end