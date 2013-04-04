require 'minitest/autorun'
require 'minitest/pride'
require_relative 'personcontroller'

describe "PersonController" do
  before do
    orig_pipe_file = "pipe.txt"
    orig_comma_file = "comma.txt"
    orig_space_file = "space.txt"

    @pipe_data = PersonController.new(orig_pipe_file)
    @comma_data = PersonController.new(orig_comma_file)
    @space_data = PersonController.new(orig_space_file)

    @parsed_pipe_data = "Smith Steve Male 3/3/1985 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue"
    @parsed_comma_data = "Abercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nKelly Sue Female 7/12/1959 Pink"
    @parsed_space_data = "Kournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\nSeles Monica Female 12/2/1973 Black"
  end

  it "requires text file as input"

  it "handles pipe delimited files" do
    @pipe_data.view.must_equal(@parsed_pipe_data)
  end

  it "handles comma delimited files" do
    @comma_data.view.must_equal(@parsed_comma_data)
  end

  it "handles space delimited files" do
    @space_data.view.must_equal(@parsed_space_data)
  end
end
