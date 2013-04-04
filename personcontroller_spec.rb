class TestPersonParser < MiniTest::Unit::TestCase
  # orig_pipe_file 
  # orig_comma_file 
  # orig_space_file  

  # parsed_pipe_file  
  # parsed_comma_file
  # parsed_space_file

  def test_parse_handles_pipe_delimited_files
    assert_equal(parsed_pipe_file, PersonParser.new(orig_pipe_file))
  end

  def test_parse_handles_comma_delimited_files
    assert_equal(parsed_comma_file, PersonParser.new(orig_comma_file))
  end

  def test_parse_handles_space_delimited_files
    assert_equal(parsed_space_file, PersonParser.new(orig_space_file))
  end

  def test_parse_accepts_text_files

  end
end
