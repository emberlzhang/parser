class Person
  attr_reader :birthdate, :fave_color, :first_name, :gender, :last_name, :middle_initial
  
  def initialize(attributes)
    @birthdate = formatted_date(attributes[:birthdate])
    @fave_color = attributes[:fave_color]
    @first_name = attributes[:first_name]
    @gender = formatted_gender(attributes[:gender])
    @last_name = attributes[:last_name]
    @middle_initial = attributes[:middle_initial]
  end

  private
  
  def formatted_date(date)
    date.gsub(/(\d{1,2})[\W](\d{1,2})[\W](\d{4})/, "\\1\/\\2\/\\3")
  end

  def formatted_gender(gender)
    if gender == "Female" || gender == "Male"
      gender
    else
      wordified(gender)
    end
  end

  def wordified(letter)
    if letter.upcase == "M"
      "Male"
    elsif letter.upcase == "F"
      "Female"
    end
  end 
end