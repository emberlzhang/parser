class PersonController
  
  #file_types :pipe, :comma, :space

  def initialize(file)
    #process_all(*files)
    orig_people_info = File.open("pipe.txt").read
    @people = []
    parsed(orig_people_info)
  end

  def parsed(content)
    content.each_line do |line|
      attributes = prepared_attributes(line)
      @people << Person.new(attributes)
    end
  end

  def prepared_attributes
    
  end

  def view
    @people.inspect
  end

  # private

  # def process_all(files)
  #   all = []
  #   all << files
  #   all.each do |file|
  #     all
  #   end
  # end
end