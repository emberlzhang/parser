require_relative "spec_helper"

describe DelimitedString do
  describe ".parse" do
    it "should return hash of attributes" do
      delimited_string = DelimitedString.new(', ', [:last_name, :first_name, :gender, :fave_color, :birthdate])
      attributes = "Abercrombie, Neil, Male, Tan, 2/13/1943\n"
      hash = { :last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :birthdate => "2/13/1943", :fave_color => "Tan" }
      delimited_string.parse(attributes).must_equal hash
    end
  end
end