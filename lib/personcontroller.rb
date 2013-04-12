class PersonController

  attr_reader :files, :people, :parsed_files, :output_files, :output_folder

  def initialize(filename, type, output_folder=".")
    @files = []
    add_file(filename, type)
    @parsed_files = []
    @output_files = []
    @people = []
    @output_folder = output_folder
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
     content << "Output #{i+1}\n#{File.open("#{output_folder}/#{f}").read}\n"
    end
    # if content.blank?
    #   content = @people.inspect
    # end
    return content
  end

  def save_and_view_by(sort_type)
    content = sorted_people(sort_type)
    content_to_s = ""
    content.each do |p|
      content_to_s << p.to_string + "\n"
    end
    File.open("#{output_folder}/output_#{sort_type}.txt", "w+") do |file|
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
    prepper = nil
    case type
    when "pipe"
      prepper = DelimitedString.new("|", [:last_name, :first_name, :middle_initial, :gender, :fave_color, :birthdate])
    when "comma"
      prepper = DelimitedString.new(",", [:last_name, :first_name, :gender, :fave_color, :birthdate])
    when "space"
      prepper = DelimitedString.new(" ", [:last_name, :first_name, :middle_initial, :gender, :birthdate, :fave_color])
    end
    prepared_attributes = prepper.parse(attributes)
  end

  private

  def update_files
    @parsed_files += @files
    @files = []
  end
end