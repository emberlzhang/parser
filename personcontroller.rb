class PersonController
  
  #file_types :pipe, :comma, :space

  def initialize(file)
    #process_all(*files)
    original_content = File.open("pipe.txt").read
    @people = []
    parsed(original_content)
  end

  def parsed(content)
    @people << content
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