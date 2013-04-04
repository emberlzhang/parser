require 'minitest/autorun'
require 'minitest/pride'
require_relative 'person'

describe "Person" do
  before do
    @person = Person.new("Chang", "Bobert", "M", "11/26/1990", "blue")
  end

  it "stores information about the person" do
    @person.last_name.must_equal "Chang"
    @person.first_name.must_equal "Bobert"
    @person.gender.must_equal "M"
    @person.birthdate.must_equal "11/26/1990"
    @person.fave_color.must_equal "blue"
  end

  it "retains information securely" do
    ATTRIBUTES = ["last_name", "first_name", "gender", "birthdate", "fave_color"]
    
    ATTRIBUTES.each do |a|
      proc { @person.a = "XXX" }.must_raise(NoMethodError)
    end
  end
end