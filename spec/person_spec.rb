require_relative 'spec_helper'

describe "Person" do
  before do
    @person                        = Person.new({ :last_name => "Chang", :first_name => "Bobert", :gender => "Male", :birthdate => "11/26/1990", :fave_color => "blue", :middle_initial => "A" })
    @person_no_middle_initial      = Person.new({ :last_name => "Cyrus", :first_name => "Miley", :gender => "Female", :birthdate => "1/1/1995", :fave_color => "pink" })
    @person_non_standard_gender    = Person.new({ :last_name => "Bonk", :first_name => "Radek", :gender => "M", :birthdate => "6/3/1975", :fave_color => "green", :middle_initial => "S" })
    @person_non_standard_birthdate = Person.new({ :birthdate => "3-3-1985", :gender => "M" })
    @person_single_digit_birthdate = Person.new({ :birthdate => "1/4/1954", :gender => "M" })
  end

  it "stores information about the person" do
    @person.last_name.must_equal "Chang"
    @person.first_name.must_equal "Bobert"
    @person.gender.must_equal "Male"
    @person.birthdate.must_equal "11/26/1990"
    @person.fave_color.must_equal "blue"
    @person.middle_initial.must_equal "A"
  end

  it "retains information securely" do
    ATTRIBUTES = ["last_name", "first_name", "gender", "birthdate", "fave_color"]
    ATTRIBUTES.each do |a|
      proc { @person.a = "Hacker attempts to change attribute" }.must_raise(NoMethodError)
    end
  end

  it "stores information without requiring middle initial" do
    @person_no_middle_initial.last_name.must_equal "Cyrus"
    @person_no_middle_initial.first_name.must_equal "Miley"
    @person_no_middle_initial.gender.must_equal "Female"
    @person_no_middle_initial.birthdate.must_equal "1/1/1995"
    @person_no_middle_initial.fave_color.must_equal "pink"
    @person_no_middle_initial.middle_initial.must_equal nil
  end

  it "correctly formats genders" do
    @person_non_standard_gender.gender.must_equal "Male"
  end
  
  it "correctly formats birthdates" do
    @person_non_standard_birthdate.birthdate.must_equal "3/3/1985"
  end

  it "provides sortable version of birthdate" do
    @person.sortable_birthdate.must_equal("1990/11/26")
    @person_single_digit_birthdate.sortable_birthdate.must_equal("1954/01/04")
  end
end