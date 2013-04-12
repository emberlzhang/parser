class CommaPrepper

  def initialize(attributes)
    @attributes = attributes.split(', ')
  end

  def to_hash
    last_name      = @attributes[0]
    first_name     = @attributes[1]
    gender         = @attributes[2]
    fave_color     = @attributes[3] 
    birthdate      = @attributes[4]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :last_name => last_name, :first_name => first_name}
  end
end