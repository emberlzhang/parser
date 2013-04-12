require_relative 'spec_helper'

describe "PipePrepper" do
  it "prepares attributes" do
    attributes = "Smith | Steve | D | M | Red | 3-3-1985"
    prepper = PipePrepper.new(attributes)
    hash = { :last_name => "Smith", :first_name => "Steve", :gender => "M", :birthdate => "3-3-1985", :fave_color => "Red", :middle_initial => "D" }
    prepper.to_hash.must_equal(hash)
  end
end