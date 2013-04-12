class SpacePrepper

  def initialize(attributes)
    @attributes = attributes.split(' ')
  end

  def to_hash
    last_name      = @attributes[0]
    first_name     = @attributes[1]
    middle_initial = @attributes[2]
    gender         = @attributes[3] 
    birthdate      = @attributes[4]
    fave_color     = @attributes[5]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :middle_initial => middle_initial, :last_name => last_name, :first_name => first_name}
  end
end