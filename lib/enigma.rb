class Enigma
  attr_reader :input, :output, :text
  def initialize
    @input  = ARGV[0]
    @output = ARGV[1]
    @text   = text
  end

  def read_input
    @text = File.read(input).gsub("\n", "")
  end

  def write_output
    File.open(output, 'w') { |file| file.write(text) }
    p @text
  end



end
