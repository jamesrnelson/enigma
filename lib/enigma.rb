require './lib/keygen'
require './lib/offset_calculator'
require 'pry'
class Enigma
  attr_reader :input, :output, :text, :characters
  def initialize(a = 0, b = 9)
    @input  = ARGV[0]
    @output = ARGV[1]
    @text   = text
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                      'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                      'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6',
                      '7', '8', '9', ' ', '.', ',']
  end

  def read_input
    @text = File.read(input).gsub("\n", "")
  end

  def write_output
    File.open(output, 'w') { |file| file.write(text) }
    @text
  end

  def encrypt(input, rotation)
     input.chars.map do |letter|
       @characters[@characters.find_index(letter.downcase) + (rotation % 39) - 39]
     end
  end
end
