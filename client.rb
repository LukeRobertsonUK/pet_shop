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



end