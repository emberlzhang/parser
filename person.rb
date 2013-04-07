require 'date'

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

  def birthdate_to_date
    birthdate_to_a = @birthdate.split("/")
    month, day, year = birthdate_to_a
    month = standardized(month)
    day = standardized(day)
    "#{year}/#{month}/#{day}"
  end

  private

  def standardized(number)
    if number.length == 1
      "0" + number
    end
  end
  
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
=begin
potential workarounds

- another strptime like: Date.strptime("#{date[0]}/#{date[1]}/#{date[2][2..3]}", '%D')
- sort_by birthyear, birthmonth, birthday, lastname
- strptime alternative: Time
- strptime alternative: DateTime
- switch order of m/d/y to y/m/d


=end

