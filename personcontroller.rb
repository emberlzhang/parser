require_relative 'person'

class PersonController
 
  attr_reader :files, :people, :parsed_files, :output_files

  def initialize(filename, type)
    @files = []
    add_file(filename, type)
    @parsed_files = []
    @output_files = []
    @people = []
  end

  def add_file(file, type)
    if file.include?(".txt")
      @files << { :name => file, :type => type }
    else
      return
    end
  end

  def parsed
    @files.each do |file|
      content = File.open(file[:name]).read
      content.each_line do |line|
        attributes = attributes_to_hash(line, file[:type])
        @people << Person.new(attributes)
      end
    end
    update_files
  end

  def print_content
    content = ""
    @output_files.each_with_index do |f, i|
      content << "Output #{i+1}\n#{File.open(f).read}\n"
    end
    return content
  end

  def save_and_view_by(sort_type)
    content = sorted_people(sort_type)
    content_to_s = ""
    content.each do |p|
      content_to_s << "#{p.last_name} #{p.first_name} #{p.gender} #{p.birthdate} #{p.fave_color}\n"
    end
    File.open("output_#{sort_type}.txt", "w+") do |file|
      file.write(content_to_s.chomp!)
    end
    @output_files << "output_#{sort_type}.txt"
  end

  def sorted_people(sort_type)
    case sort_type
    when "gender"
      @people.sort_by! { |p| [p.gender, p.last_name] }
    when "birthdate"
      @people.sort_by! { |p| [p.sortable_birthdate, p.last_name] }
    when "last_name"
      @people.sort_by! { |p| p.last_name }.reverse
    end
  end

  def attributes_to_hash(attributes, type)
    case type
    when "pipe"
      prepared_pipe(attributes)
    when "comma"
      prepared_comma(attributes)
    when "space"
      prepared_space(attributes)
    end
  end

  private

  def update_files
    @parsed_files += @files
    @files = []
  end

  def prepared_pipe(attributes)
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

  def prepared_comma(attributes)
    clean_attributes = attributes.gsub("\n", "")
    attribute_array = clean_attributes.split(", ")
    last_name      = attribute_array[0]
    first_name     = attribute_array[1]
    gender         = attribute_array[2]
    fave_color     = attribute_array[3] 
    birthdate      = attribute_array[4]
    attribute_hash = { :birthdate => birthdate, :fave_color => fave_color, :gender => gender, :last_name => last_name, :first_name => first_name}
  end

  def prepared_space(attributes)
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
end