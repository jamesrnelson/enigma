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
    #@text
  end

  def rotations
    OffsetCalculator.new
  end

  def encrypt(input, rotation = [a = 0, b = 0, c = 0, d = 0])
    rotation = rotations.final_rotations
      counter = -1
      @text = input.chars.map do |letter|
        counter += 1
         if counter % 4 == 0
           @characters[@characters.find_index(letter.downcase) + (rotation[0] % 39) - 39]
         elsif counter % 4 == 1
           @characters[@characters.find_index(letter.downcase) + (rotation[1] % 39) - 39]
         elsif counter % 4 == 2
           @characters[@characters.find_index(letter.downcase) + (rotation[2] % 39) - 39]
         elsif counter % 4 == 3
           @characters[@characters.find_index(letter.downcase) + (rotation[3] % 39) - 39]
         end
     end
     write_output
  end
end
