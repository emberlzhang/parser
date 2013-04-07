require_relative 'person'

class PersonController
  
  attr_reader :files, :people, :parsed_files

  def initialize(filename, type)
    @files = []
    add_file(filename, type)
    #@parsed_files = []
    @people = []
  end

  def add_file(file, type)
    @files << { :name => file, :type => type }
  end

  def parsed # parses data and makes Person objects
    @files.each do |file|
      content = File.open(file[:name]).read
      content.each_line do |line|
        attributes = attributes_to_hash(line, file[:type])
        @people << Person.new(attributes)
      end
      #@parsed_files << @files.shift
    end
  end

  # def save_and_view_by(sort_type)
  #   sorted = sorted_people(sort_type)
  #   File.new("output_#{sort_type}.txt", "w") do |file|
  #     sorted.each { |person| file < person. }
  #   end
  # end

  def sorted_people(sort_type)
    case sort_type
    when "gender"
      @people.sort_by { |p| [p.gender, p.last_name] }
    when "birthdate"
      @people.sort_by { |p| [p.birthdate_to_date, p.last_name] }
    when "last_name"
      @people.sort_by { |p| p.last_name }.reverse
    end
  end
end

  def attributes_to_hash(attributes, type) #parses data and prepares hash for person object
    case type
    when "pipe"
      prepared_pipe_attributes(attributes)
    when "comma"
      prepared_comma_attributes(attributes)
    when "space"
      prepared_space_attributes(attributes)
    end
  end

  def prepared_pipe_attributes(attributes)
    clean_attributes = attributes.gsub("\n", "")
    attribute_array = clean_attributes.split(' | ')
    last_name      = attribute_array[0]
    first_name     = attribute_array[1]
    middle_initial = attribute_array[2]
    gender         = attribute_array[3]
    fave_color     = attribute_array[4] 
    birthdate      = attribute_array[5]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :middle_initial => middle_initial, :last_name => last_name, :first_name => first_name}
  end

  def prepared_comma_attributes(attributes)
    clean_attributes = attributes.gsub("\n", "")
    attribute_array = clean_attributes.split(", ")
    last_name      = attribute_array[0]
    first_name     = attribute_array[1]
    gender         = attribute_array[2]
    fave_color     = attribute_array[3] 
    birthdate      = attribute_array[4]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :last_name => last_name, :first_name => first_name}
  end

  def prepared_space_attributes(attributes)
    clean_attributes = attributes.gsub("\n", "")
    attribute_array = clean_attributes.split(' ')
    last_name      = attribute_array[0]
    first_name     = attribute_array[1]
    middle_initial = attribute_array[2]
    gender         = attribute_array[3] 
    birthdate      = attribute_array[4]
    fave_color     = attribute_array[5]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :middle_initial => middle_initial, :last_name => last_name, :first_name => first_name}
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