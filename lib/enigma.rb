require './lib/keygen'
require './lib/offset_calculator'
require 'pry'
require 'Date'
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

  # def rotations
  #   OffsetCalculator.new
  # end

  def encrypt(input, rotation = [a = 0, b = 0, c = 0, d = 0])
    # rotation = rotations.final_rotations
    counter = -1
    input.chars.map.with_index do |letter|
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
    end.join
  end

  def decrypt(scrambled_message, key)
    key = combiner(key)
    counter = -1
    scrambled_message.chars.map do |letter|
    counter += 1
      if counter % 4 == 0
        @characters[@characters.find_index(letter.downcase) - (key[0] % 39) - 39]
      elsif counter % 4 == 1
        @characters[@characters.find_index(letter.downcase) - (key[1] % 39) - 39]
      elsif counter % 4 == 2
        @characters[@characters.find_index(letter.downcase) - (key[2] % 39) - 39]
      elsif counter % 4 == 3
        @characters[@characters.find_index(letter.downcase) - (key[3] % 39) - 39]
      end
    end.join
  end

  def manual_key_entry(key_string)
    #binding.pry
    key_digits = key_string.chars
    key_a = key_digits[0] + key_digits[1]
    key_b = key_digits[1] + key_digits[2]
    key_c = key_digits[2] + key_digits[3]
    key_d = key_digits[3] + key_digits[4]
    [key_a.to_i, key_b.to_i, key_c.to_i, key_d.to_i]
  end

  def date_offset
    date = Date.today
    squared_date = date.strftime('%d%m%y').to_i**2
    squared_date.digits[0..3].reverse
  end

  def combiner(key_string)
    key_date_offset = manual_key_entry(key_string).zip(date_offset)
    key_date_offset.map { |key| key.sum }
  end


  def crack(scrambled_message, date)

  end
end
