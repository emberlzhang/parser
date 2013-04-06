require 'minitest/autorun'
require 'minitest/pride'
require_relative 'personcontroller'
require_relative 'person'

describe "PersonController" do
  before do
    # orig_pipe_file = "pipe.txt"
    # orig_comma_file = "comma.txt"
    # orig_space_file = "space.txt"

    # @pipe_data = PersonController.new(orig_pipe_file)
    # @comma_data = PersonController.new(orig_comma_file)
    # @space_data = PersonController.new(orig_space_file)

    # @parsed_by_birthdate = File.open("output_birthdate_ascending.txt")
    # @parsed_by_gender = File.open("output_gender_f_m.txt")
    # @parsed_by_lastname = File.open("output_lastname_ascending.txt")

    # @orig_pipe_data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
    # @orig_comma_data = "Abercrombie, Neil, Male, Tan, 2/13/1943\nBishop, Timothy, Male, Yellow, 4/23/1967\nKelly, Sue, Female, Pink, 7/12/1959"
    # @orig_space_data = "Kournikova Anna F F 6-3-1975 Red\nHingis Martina M F 4-2-1979 Green\nSeles Monica H F 12-2-1973 Black"

    # @parsed_pipe_data = "Smith Steve Male 3/3/1985 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue"
    # @parsed_comma_data = "Abercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nKelly Sue Female 7/12/1959 Pink"
    # inaccurate! @parsed_space_data = "Kournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\nSeles Monica Female 12/2/1973 Black"
    
    @orig_pipe_person1 = "Smith | Steve | D | M | Red | 3-3-1985\n"
    @orig_pipe_person2 = "Bonk | Radek | S | M | Green | 6-3-1975\n"
    @orig_pipe_person3 = "Bouillon | Francis | G | M | Blue | 6-3-1975"
    
    @prepped_pipe_attributes1 = { :last_name => "Smith", :first_name => "Steve", :gender => "M", :birthdate => "3-3-1985", :fave_color => "Red", :middle_initial => "D" }
    @prepped_pipe_attributes2 = { :last_name => "Bonk", :first_name => "Radek", :gender => "M", :birthdate => "6-3-1975", :fave_color => "Green", :middle_initial => "S" }
    @prepped_pipe_attributes3 = { :last_name => "Bouillon", :first_name => "Francis", :gender => "M", :birthdate => "6-3-1975", :fave_color => "Blue", :middle_initial => "G" }
  
    # @pipe_person1 = Person.new(@prepped_pipe_attributes1)
    # @pipe_person2 = Person.new(@prepped_pipe_attributes2)
    # @pipe_person3 = Person.new(@prepped_pipe_attributes3)

    @orig_comma_person1 = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
    @orig_comma_person2 = "Bishop, Timothy, Male, Yellow, 4/23/1967\n"
    @orig_comma_person3 = "Kelly, Sue, Female, Pink, 7/12/1959"

    @prepped_comma_attributes1 = { :last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :birthdate => "2/13/1943", :fave_color => "Tan" }
    @prepped_comma_attributes2 = { :last_name => "Bishop", :first_name => "Timothy", :gender => "Male", :birthdate => "4/23/1967", :fave_color => "Yellow" }
    @prepped_comma_attributes3 = { :last_name => "Kelly", :first_name => "Sue", :gender => "Female", :birthdate => "7/12/1959", :fave_color => "Pink" }
  
    @orig_space_person1 = "Kournikova Anna F F 6-3-1975 Red\n"
    @orig_space_person2 = "Hingis Martina M F 4-2-1979 Green\n"
    @orig_space_person3 = "Seles Monica H F 12-2-1973 Black"

    @prepped_space_attributes1 = { :last_name => "Kournikova", :first_name => "Anna", :middle_initial => "F", :gender => "F", :birthdate => "6-3-1975", :fave_color => "Red"}
    @prepped_space_attributes2 = { :last_name => "Hingis", :first_name => "Martina", :middle_initial => "M", :gender => "F", :birthdate => "4-2-1979", :fave_color => "Green"}
    @prepped_space_attributes3 = { :last_name => "Seles", :first_name => "Monica", :middle_initial => "H", :gender => "F", :birthdate => "12-2-1973", :fave_color => "Black"}
  end

  describe "initialization" do
    it "retains information about initial file" do
      people = PersonController.new("pipe.txt", "pipe")
      people.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }]
    end

    # it "requires text file as input" do
    #   expect{PersonController.new("blah.png", "pipe")}.to_raise WrongFileFormatError
    # end

    # it "requires valid file type as input" do
    #   expect{PersonController.new("blah.png", "pipe")}.to_raise NoFileTypeError
    # end
  end

  describe "adding new files" do
    it "retains information about multiple files" do
      people = PersonController.new("pipe.txt", "pipe")
      people.add_file("comma.txt", "comma")
      people.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }, { :name => "comma.txt", :type => "comma" }]
      people.add_file("space.txt", "space")
      people.files.must_equal [{ :name => "pipe.txt", :type => "pipe" }, { :name => "comma.txt", :type => "comma" }, { :name => "space.txt", :type => "space" }]
    end
  end

  describe "when parsing data" do
    it "handles pipe delimited files" do
      attributes_to_hash(@orig_pipe_person1, "pipe").must_equal(@prepped_pipe_attributes1)
      attributes_to_hash(@orig_pipe_person2, "pipe").must_equal(@prepped_pipe_attributes2)
      attributes_to_hash(@orig_pipe_person3, "pipe").must_equal(@prepped_pipe_attributes3)
    end

    it "handles comma delimited files" do
      attributes_to_hash(@orig_comma_person1, "pipe").must_equal(@prepped_comma_attributes1)
      attributes_to_hash(@orig_comma_person2, "pipe").must_equal(@prepped_comma_attributes2)
      attributes_to_hash(@orig_comma_person3, "pipe").must_equal(@prepped_comma_attributes3)
    end

    it "handles space delimited files" do
      attributes_to_hash(@orig_space_person1, "space").must_equal(@prepped_space_attributes1)
      attributes_to_hash(@orig_space_person2, "space").must_equal(@prepped_space_attributes2)
      attributes_to_hash(@orig_space_person3, "space").must_equal(@prepped_space_attributes3)
    end

    it "stores people information from pipe delimited files" do
      peeps = PersonController.new("pipe.txt", "pipe")
      peeps.people.must_be_empty
      peeps.parsed
      peeps.people.wont_be_empty
    end

    it "stores people information from comma delimited files" do
      peeps = PersonController.new("comma.txt", "comma")
      peeps.people.must_be_empty
      peeps.parsed
      peeps.people.wont_be_empty
    end

    it "stores people information from space delimited files" do
      peeps = PersonController.new("space.txt", "space")
      peeps.people.must_be_empty
      peeps.parsed
      peeps.people.wont_be_empty
    end

    # def expect_parse_stores_information(controller)
    #   controller.parsed
    #   controller.people.wont_be_empty
    #   person1 = Person.new({ :last_name => "Smith", :first_name => "Steve", :gender => "Male", :birthdate => "3/3/1985", :fave_color => "Red" })
    #   person2 = Person.new({ :last_name => "Smith", :first_name => "Steve", :gender => "Male", :birthdate => "3/3/1985", :fave_color => "Red" })
    #   person3 = Person.new({ :last_name => "Smith", :first_name => "Steve", :gender => "Male", :birthdate => "3/3/1985", :fave_color => "Red" })
    #   controller.people.must_equal [person1, person2, person3]
    # end
  end
end
