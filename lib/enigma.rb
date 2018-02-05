require './lib/keygen'
require './lib/offset_calculator'
require 'pry'
class Enigma
  attr_reader :input, :output, :text
  def initialize(a=0, b=9)
    @input  = ARGV[0]
    @output = ARGV[1]
    @text   = text

  end

  def read_input
    @text = File.read(input).gsub("\n", "")
  end

  def write_output
    File.open(output, 'w') { |file| file.write(text) }
    @text
  end





end
