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

    # @parsed_by_birthdate = File.open("output_birthdate_ascending.txt")
    # @parsed_by_gender = File.open("output_gender_f_m.txt")
    # @parsed_by_lastname = File.open("output_lastname_ascending.txt")

    @orig_pipe_data = "Smith | Steve | D | M | Red | 3-3-1985\nBonk | Radek | S | M | Green | 6-3-1975\nBouillon | Francis | G | M | Blue | 6-3-1975"
    @orig_comma_data = "Abercrombie, Neil, Male, Tan, 2/13/1943\nBishop, Timothy, Male, Yellow, 4/23/1967\nKelly, Sue, Female, Pink, 7/12/1959"
    @orig_space_data = 

    @parsed_pipe_data = "Smith Steve Male 3/3/1985 Red\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue"
    @parsed_comma_data = "Abercrombie Neil Male 2/13/1943 Tan\nBishop Timothy Male 4/23/1967 Yellow\nKelly Sue Female 7/12/1959 Pink"
    @parsed_space_data = "Kournikova Anna Female 6/3/1975 Red\nHingis Martina Female 4/2/1979 Green\nSeles Monica Female 12/2/1973 Black"
  end

  it "requires text file as input"

  it "handles pipe delimited files" do
    parse(@orig_pipe_data).must_equal(@parsed_pipe_data)
  end

  it "handles comma delimited files" do
    #@comma_data.view.must_equal(@parsed_comma_data)
  end

  it "handles space delimited files" do
    #@space_data.view.must_equal(@parsed_space_data)
  end
end
