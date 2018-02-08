require './lib/keygen'
require './lib/offset_calculator'
require 'pry'
require 'Date'

class Enigma
  attr_reader :input,
              :output,
              :text,
              :characters,
              :command_line_key,
              :command_line_date,
              :key_string
  def initialize(a = 0, b = 9)
    @input  = ARGV[0]
    @output = ARGV[1]
    @rotations = OffsetCalculator.new
    @command_line_key = ARGV[2]
    @command_line_date = ARGV[3]
    @text   = text
    @characters =    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
                      'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
                      's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0',
                      '1', '2', '3', '4', '5', '6', '7', '8', '9',
                      ' ', '.', ',']
  end

  def read_input
    @text = File.read(input).gsub("\n", "")
    # binding.pry

  end

  def write_encrypt_output
    # binding.pry
    File.open(@output, 'w') { |file| file.puts @text }
    # binding.pry
    puts "Created #{@output} with the key #{@rotations.key_string} and date #{@rotations.date_string}"
  end

  def write_decrypt_output
    File.open(@output, 'w') { |file| file.puts @text }
    puts "Created #{@output} with the key #{@command_line_key} and date #{@command_line_date}"
  end

  # def rotations
  #   OffsetCalculator.new
  # end

  def encrypt(input, rotation = [a = 0, b = 0, c = 0, d = 0])

    input = @text
    rotation = @rotations.final_rotations
    # binding.pry
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
    end.join
    # binding.pry
    write_encrypt_output
   end

  def decrypt(scrambled_message, key)
    key = @command_line_key
    scrambled_message = @text
    # binding.pry
    counter = -1
    @text = scrambled_message.chars.map do |letter|
    counter += 1
      if counter % 4 == 0
        decrypt_rotation_a(letter, key)
      elsif counter % 4 == 1
        decrypt_rotation_b(letter, key)
      elsif counter % 4 == 2
        decrypt_rotation_c(letter, key)
      elsif counter % 4 == 3
        decrypt_rotation_d(letter, key)
      end
    end.join
    write_decrypt_output
  end

  def decrypt_rotation_a(letter, key)
    if combiner(key)[0] > @characters.find_index(letter.downcase)
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[0] % 39)]
    else
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[0] % 39) - 39]
    end
  end

  def decrypt_rotation_b(letter, key)
    if combiner(key)[1] > @characters.find_index(letter.downcase)
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[1] % 39)]
    else
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[1] % 39) - 39]
    end
  end

  def decrypt_rotation_c(letter, key)
    if combiner(key)[2] > @characters.find_index(letter.downcase)
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[2] % 39)]
    else
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[2] % 39) - 39]
    end
  end

  def decrypt_rotation_d(letter, key)
    if combiner(key)[3] > @characters.find_index(letter.downcase)
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[3] % 39)]
    else
      @characters[@characters.find_index(letter.downcase) - (combiner(key)[3] % 39) - 39]
    end
  end

  def manual_key_entry(key_string)
    key_string = @command_line_key
    key_digits = key_string.chars
    key_a = key_digits[0] + key_digits[1]
    key_b = key_digits[1] + key_digits[2]
    key_c = key_digits[2] + key_digits[3]
    key_d = key_digits[3] + key_digits[4]
    [key_a.to_i, key_b.to_i, key_c.to_i, key_d.to_i]
  end

  def date_offset(date = Date.today)
    date = @command_line_date.to_s
    squared_date = date.to_i ** 2
    squared_date.digits[0..3].reverse
  end

  def combiner(key_string)
    key_date_offset = manual_key_entry(key_string).zip(date_offset)
    key_date_offset.map { |key| key.sum }
  end

  def crack(scrambled_message, date)

  end
end
