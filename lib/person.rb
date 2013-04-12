class Person
  attr_reader :birthdate, :fave_color, :first_name, :gender, :last_name, :middle_initial
  
  def initialize(attributes)
    @birthdate = standardized_date(attributes[:birthdate])
    @fave_color = attributes[:fave_color]
    @first_name = attributes[:first_name]
    @gender = standardized_gender(attributes[:gender])
    @last_name = attributes[:last_name]
    @middle_initial = attributes[:middle_initial]
  end

  def sortable_birthdate
    birthdate_to_a = birthdate.split("/")
    month, day, year = birthdate_to_a
    month = sortable(month)
    day = sortable(day)
    "#{year}/#{month}/#{day}"
  end

  def to_string
    "#{last_name} #{first_name} #{gender} #{birthdate} #{fave_color}"
  end

  def ==(other)
    birthdate == other.birthdate &&
    fave_color == other.fave_color &&
    first_name == other.first_name &&
    gender == other.gender &&
    last_name == other.last_name &&
    middle_initial == other.middle_initial
  end

  private

  def sortable(date_number)
    if date_number.length == 1
      date_number = "0" + date_number
    end
    date_number
  end
  
  def standardized_date(date)
    date.gsub(/(\d{1,2})[\W](\d{1,2})[\W](\d{4})/, "\\1\/\\2\/\\3")
  end

  def standardized_gender(gender)
    if gender[0].upcase == "F"
      "Female"
    elsif gender[0].upcase == "M"
      "Male"
    end
  end
end