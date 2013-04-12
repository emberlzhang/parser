class DelimitedString

  def initialize(delimiter, attribute_keys)
    @delimiter = delimiter
    @attribute_keys = attribute_keys
  end

  def parse(string)
    attributes = string.split(@delimiter)
    hash = {}
    @attribute_keys.each_with_index do |k, i|
      hash[k] = attributes[i].strip
    end
    hash
  end

end