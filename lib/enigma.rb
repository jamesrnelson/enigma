class Enigma
  attr_reader :input, :output
  def initialize
    @input  = ARGV[0]
    @output = ARGV[1]
  end

  def read_data_input
    @input_text = File.read(input).gsub("\n", "")
  end



end
