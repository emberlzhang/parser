require 'minitest/autorun'
require 'minitest/pride'
require_relative 'person'

describe "Person" do

  it "stores information about the person" do
    attributes = { :last_name => "Chang", :first_name => "Bobert", :gender => "Male", :birthdate => "11/26/1990", :fave_color => "blue", :middle_initial => "A" }
    person = Person.new(attributes)
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
    attributes = { :last_name => "Cyrus", :first_name => "Miley", :gender => "Female", :birthdate => "1/1/1995", :fave_color => "pink" }
    person_without_middle_initial = Person.new(attributes)
    person_without_middle_initial.last_name.must_equal "Cyrus"
    person_without_middle_initial.first_name.must_equal "Miley"
    person_without_middle_initial.gender.must_equal "Female"
    person_without_middle_initial.birthdate.must_equal "1/1/1995"
    person_without_middle_initial.fave_color.must_equal "pink"
    person_without_middle_initial.middle_initial.must_equal nil
  end

  it "correctly formats genders" do
    attributes = { :last_name => "Bonk", :first_name => "Radek", :gender => "M", :birthdate => "6/3/1975", :fave_color => "green", :middle_initial => "S" }
    person_with_wrong_gender_format = Person.new(attributes)
    person_with_wrong_gender_format.gender.must_equal "Male"
  end
  
  it "correctly formats birthdates" do
    attributes = { :last_name => "Smith", :first_name => "Steve", :gender => "M", :birthdate => "3-3-1985", :fave_color => "Red", :middle_initial => "D" }
    person_with_incorrect_birthdate_format = Person.new(attributes)
    person_with_incorrect_birthdate_format.birthdate.must_equal "3/3/1985"
  end
end