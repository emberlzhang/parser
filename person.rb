class Person
  attr_reader :last_name, :first_name, :gender, :birthdate, :fave_color
  
  def initialize(last_name, first_name, gender, birthdate, fave_color)
    @last_name = last_name
    @first_name = first_name
    @gender = gender
    @birthdate = birthdate
    @fave_color = fave_color
  end
end