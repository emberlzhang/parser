require 'minitest/autorun'
require 'minitest/pride'
require_relative 'person'

describe "Person" do

  it "stores information about the person" do
    person = Person.new("Chang", "Bobert", "Male", "11/26/1990", "blue", "A")
    person.last_name.must_equal "Chang"
    person.first_name.must_equal "Bobert"
    person.gender.must_equal "Male"
    person.birthdate.must_equal "11/26/1990"
    person.fave_color.must_equal "blue"
    person.middle_initial.must_equal "A"
  end

  it "retains information securely" do
    ATTRIBUTES = ["last_name", "first_name", "gender", "birthdate", "fave_color"]
    ATTRIBUTES.each do |a|
      proc { @person.a = "XXX" }.must_raise(NoMethodError)
    end
  end

  it "stores information without requiring middle initial" do
    person_without_middle_initial = Person.new("Cyrus", "Miley", "F", "01/01/1995", "pink")
    person_without_middle_initial.last_name.must_equal "Cyrus"
    person_without_middle_initial.first_name.must_equal "Miley"
    person_without_middle_initial.gender.must_equal "Female"
    person_without_middle_initial.birthdate.must_equal "01/01/1995"
    person_without_middle_initial.fave_color.must_equal "pink"
    person_without_middle_initial.middle_initial.must_equal nil
  end

  it "correctly formats genders" do
    person_with_wrong_gender_format = Person.new("Bonk", "Radek", "M", "6/3/1975", "Green", "S")
    person_with_wrong_gender_format.gender.must_equal "Male"
  end
  
  it "correctly formats birthdates" do
    person_with_incorrect_birthdate_format = Person.new("Smith", "Steve", "M", "3-3-1985", "Red", "D")
    person_with_incorrect_birthdate_format.birthdate.must_equal "3/3/1985"
  end
end