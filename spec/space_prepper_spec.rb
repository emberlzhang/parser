require_relative 'spec_helper'

describe "SpacePrepper" do
  it "prepares attributes" do
    attributes = "Kournikova Anna F F 6-3-1975 Red"
    prepper = SpacePrepper.new(attributes)
    hash = { :last_name => "Kournikova", :first_name => "Anna", :middle_initial => "F", :gender => "F", :birthdate => "6-3-1975", :fave_color => "Red"}
    prepper.to_hash.must_equal(hash)
  end
end