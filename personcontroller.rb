class PersonController
  
  def initialize(filename, type)
    @files = []
    add_file(filename, type)
    @parsed_files = []
    @people = []
  end

  def add_file(file, type)
    @files << { :file => file, :type => type }
  end

  def parsed # parses data and makes Person objects
    @files.each do |file|
      content = File.open(file[:name]).read
      content.each_line do |line|
        attributes = attributes_to_hash(line, file[:type])
        @people << Person.new(attributes)
      end
      @parsed_files << @files.shift
    end
  end

"Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
"Smith Steve Male 3/3/1985 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue"
  # def attributes_to_hash(attributes, type)
  #   clean_string = name.gsub("\n", "")
  #   last_name =
  #   first_name =
  #   middle_initial = 
  #   gender = 
  #   birthdate =
  #   fave_color = 
  #   attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :middle_initial => middle_initial, :last_name => last_name, :first_name => first_name}
  # end

  def save_and_view_by(sort_type)
    sorted_people(sort_type)
    File.new("gender_sorted.txt", "w") do |file|
      sorted_people.each { |person| file < person. }
    end
  end

  private

  def sorted_people(sort_type)
    sorted_people = ""
    case sort_type
    when "gender"
      sorted_people = sort_by_gender_lastname
    when "birthdate"
      sorted_people = sort_by_birthdate
    else #"lastname"
      sorted_people = sort_by_lastname
    end
  end

  def sort_by_gender_lastname
    gender_sorted          = @people.sort_by { |k| k[:gender] }
    gender_lastname_sorted = gender_sorted.sort_by { |k| k[:last_name] }
  end

  def sort_by_birthdate
    birthdate_sorted = @people.sort_by { |k| k[:birthdate] }
  end

  def sort_by_lastname
    lastname_sorted = @people.sort_by { |k| k[:last_name] }
  end
end

#people = PersonController.new("pipe.txt", "comma.txt", "space.txt")

#people = PersonController.new("pipe.txt", "pipe")
#people.parsed
#people.add_file("comma.txt", "comma")
#people.parsed
#people.add_file("space.txt", "space")
#people.parsed
#people.save_and_view_by("gender")
#people.save_and_view_by("birthdate")
#people.save_and_view_by("lastname")