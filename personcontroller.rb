class PersonController
  def initialize(file)
    #process_all(*files)
    @original_content = File.open("pipe.txt").read
    @parsed_content
  end

  # def view
  #   @parsed_string
  # end

  # private

  # def process_all(*files)
  #   all = []
  #   all << files
  #   all.each do |file|
  #     all
  #   end
  # end
end