require_relative 'spec_helper'

describe "CommaPrepper" do
  it "prepares attributes" do
    attributes = "Abercrombie, Neil, Male, Tan, 2/13/1943"
    prepper = CommaPrepper.new(attributes)
    hash = { :last_name => "Abercrombie", :first_name => "Neil", :gender => "Male", :birthdate => "2/13/1943", :fave_color => "Tan" }
    prepper.to_hash.must_equal(hash)
  end
end