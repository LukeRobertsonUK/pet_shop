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
    "#{name} has #{pets.size} pets."
  end

  def full_client_info
  #do stuff
  end



end