require 'minitest/autorun'
require 'minitest/pride'
require_relative 'personcontroller'
require_relative 'person'

describe "PersonController" do
  before do
    #TODO: Put everything in here into helper or factory files.

    @birthdate_sorted_data = File.open("output_birthdate_ascending.txt").read
    @gender_sorted_data = File.open("output_gender_f_m.txt").read
    @lastname_sorted_data = File.open("output_lastname_descending.txt").read

    @orig_pipe_person1 = "Smith | Steve | D | M | Red | 3-3-1985\n"
    @orig_pipe_person2 = "Bonk | Radek | S | M | Green | 6-3-1975\n"
    @orig_pipe_person3 = "Bouillon | Francis | G | M | Blue | 6-3-1975"
    
    @orig_comma_person1 = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
    @orig_comma_person2 = "Bishop, Timothy, Male, Yellow, 4/23/1967\n"
    @orig_comma_person3 = "Kelly, Sue, Female, Pink, 7/12/1959"

    @orig_space_person1 = "Kournikova Anna F F 6-3-1975 Red\n"
    @orig_space_person2 = "Hingis Martina M F 4-2-1979 Green\n"
    @orig_space_person3 = "Seles Monica H F 12-2-1973 Black"

    @prepped_pipe_attributes1 = { :last_name => "Smith", :first_name => "Steve", :gender => "M", :birthdate => "3-3-1985", :fave_color => "Red", :middle_initial => "D" }
    @prepped_pipe_attributes2 = { :last_name => "Bonk", :first_name => "Radek", :gender => "M", :birthdate => "6-3-1975", :fave_color => "Green", :middle_initial => "S" }
    @prepped_pipe_attributes3 = { :last_name => "Bouillon", :first_name => "Francis", :gender => "M", :birthdate => "6-3-1975", :fave_color => "Blue", :middle_initial => "G" }
  
    @prepped_comma_attributes1 = { :last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :birthdate => "2/13/1943", :fave_color => "Tan" }
    @prepped_comma_attributes2 = { :last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :birthdate => "4/23/1967", :fave_color => "Yellow" }
    @prepped_comma_attributes3 = { :last_name => "Kelly", :first_name => "Sue", :gender => "Female", :birthdate => "7/12/1959", :fave_color => "Pink" }

    @prepped_space_attributes1 = { :last_name => "Kournikova", :first_name => "Anna", :middle_initial => "F", :gender => "F", :birthdate => "6-3-1975", :fave_color => "Red"}
    @prepped_space_attributes2 = { :last_name => "Hingis", :first_name => "Martina", :middle_initial => "M", :gender => "F", :birthdate => "4-2-1979", :fave_color => "Green"}
    @prepped_space_attributes3 = { :last_name => "Seles", :first_name => "Monica", :middle_initial => "H", :gender => "F", :birthdate => "12-2-1973", :fave_color => "Black"}

    @person1 = Person.new(@prepped_space_attributes2) #hingis martina
    @person2 = Person.new(@prepped_comma_attributes3) #kelly sue
    @person3 = Person.new(@prepped_space_attributes1) #kournikova anna
    @person4 = Person.new(@prepped_space_attributes3) #seles monica
    @person5 = Person.new(@prepped_comma_attributes1) #abercrombie, neil
    @person6 = Person.new(@prepped_comma_attributes2) #bishop timothy
    @person7 = Person.new(@prepped_pipe_attributes2) #bonk redik
    @person8 = Person.new(@prepped_pipe_attributes3) #bouillon francis
    @person9 = Person.new(@prepped_pipe_attributes1) #smith steve

    @pipe = PersonController.new("pipe.txt", "pipe")
    @comma = PersonController.new("comma.txt", "comma")
    @space = PersonController.new("space.txt", "space")

    def uploaded_and_parsed_people
      @pipe.add_file("comma.txt", "comma")
      @pipe.add_file("space.txt", "space")
      @pipe.parsed
      @pipe
    end

    def assert_storage_of_data(type)
      type.people.must_be_empty
      type.parsed
      type.people.length.must_equal(3)
    end
  end

  describe "initialization" do
    it "retains information about initial file" do
      @pipe.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }]
    end

    it "requires text file as input" do
      bad_file = PersonController.new("bad_file.png", "pipe")
      bad_file.files.must_be_empty
    end
  end

  describe "printing content" do
    it "returns the desired output types" do
      @comma.parsed
      @comma.save_and_view_by("gender")
      @comma.save_and_view_by("birthdate")
      @comma.save_and_view_by("last_name")
      output = "Output 1\nKelly Sue Female 7/12/1959 Pink\nAbercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nOutput 2\nAbercrombie Neil Male 2/13/1943 Tan\nKelly Sue Female 7/12/1959 Pink\nBishop Timothy Male 4/23/1967 Yellow\nOutput 3\nKelly Sue Female 7/12/1959 Pink\nBishop Timothy Male 4/23/1967 Yellow\nAbercrombie Neil Male 2/13/1943 Tan\n"
      @comma.print_content.must_equal(output)
    end
  end

  describe "adding new files" do
    it "retains information about multiple files" do
      @pipe.add_file("comma.txt", "comma")
      @pipe.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }, { :name => "comma.txt", :type => "comma" }]
      @pipe.add_file("space.txt", "space")
      @pipe.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }, { :name => "comma.txt", :type => "comma" }, { :name => "space.txt", :type => "space" }]
    end
  end

  describe "when parsing individual person data" do
    it "handles pipe delimited files" do
      @pipe.attributes_to_hash(@orig_pipe_person1, "pipe").must_equal(@prepped_pipe_attributes1)
      @pipe.attributes_to_hash(@orig_pipe_person2, "pipe").must_equal(@prepped_pipe_attributes2)
      @pipe.attributes_to_hash(@orig_pipe_person3, "pipe").must_equal(@prepped_pipe_attributes3)
    end

    it "handles comma delimited files" do
      @comma.attributes_to_hash(@orig_comma_person1, "comma").must_equal(@prepped_comma_attributes1)
      @comma.attributes_to_hash(@orig_comma_person2, "comma").must_equal(@prepped_comma_attributes2)
      @comma.attributes_to_hash(@orig_comma_person3, "comma").must_equal(@prepped_comma_attributes3)
    end

    it "handles space delimited files" do
      @space.attributes_to_hash(@orig_space_person1, "space").must_equal(@prepped_space_attributes1)
      @space.attributes_to_hash(@orig_space_person2, "space").must_equal(@prepped_space_attributes2)
      @space.attributes_to_hash(@orig_space_person3, "space").must_equal(@prepped_space_attributes3)
    end
  end

  describe "when parsing and storing data" do
    it "stores people information from pipe delimited files" do
      assert_storage_of_data(@pipe)
    end

    it "stores people information from comma delimited files" do
      assert_storage_of_data(@comma)
    end

    it "stores people information from space delimited files" do
      assert_storage_of_data(@space)
    end

    it "remembers parsed files" do
      uploaded_and_parsed_people.parsed_files.length.must_equal(3)
    end
  end

  describe "making output files" do
    it "shows by gender" do
      uploaded_and_parsed_people.save_and_view_by("gender")
      File.open("output_gender.txt").read.must_equal(@gender_sorted_data)
    end
    
    it "shows by birthdate" do
      uploaded_and_parsed_people.save_and_view_by("birthdate")
      File.open("output_birthdate.txt").read.must_equal(@birthdate_sorted_data)
    end

    it "shows by last name" do
      uploaded_and_parsed_people.save_and_view_by("last_name")
      File.open("output_last_name.txt").read.must_equal(@lastname_sorted_data)
    end

    it "remembers all output files made" do
      uploaded_and_parsed_people.output_files.must_be_empty
      uploaded_and_parsed_people.save_and_view_by("gender")
      uploaded_and_parsed_people.save_and_view_by("birthdate")
      uploaded_and_parsed_people.save_and_view_by("last_name")
      uploaded_and_parsed_people.output_files.length.must_equal(3)
    end
  end

  describe "sorting people" do
    #NOTE: Tests in here should "fail" with "No visible difference" message. This is considered a passing test.
    #Any other failures should be considered actual failure.
    #TODO: Make these tests pass when they should be passing.

    it "sorts by gender and fail this test with message: No visible difference." do
      sorted_mock = [@person1, @person2, @person3, @person4, @person5, @person6, @person7, @person8, @person9]
      uploaded_and_parsed_people.sorted_people("gender").must_equal(sorted_mock)
    end

    it "sorts by birthdate and fail this test with message: No visible difference." do
      sorted_mock = [@person5, @person2, @person6, @person4, @person7, @person8, @person3, @person1, @person9]
      uploaded_and_parsed_people.sorted_people("birthdate").must_equal(sorted_mock)
    end

    it "sorts by last name and fail this test with message: No visible difference." do
      sorted_mock = [@person9, @person4, @person3, @person2, @person1, @person8, @person7, @person6, @person5]
      uploaded_and_parsed_people.sorted_people("last_name").must_equal(sorted_mock)
    end
  end
end




