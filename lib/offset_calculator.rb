require 'Date'
require 'pry'
require './lib/keygen'
# This calculator will take the key created by keygen,
# perform some math wizardry with the current date,
# and then determine the total rotation for each letter.
class OffsetCalculator
  attr_reader :the_date,
              :the_squared_date,
              :the_date_offset,
              :combined_keys,
              :final_rotations

  def initialize(date = Date.today, a = 0, b = 9)
    @key_generator = KeyGen.new(a, b)
    @the_date = date.strftime('%d%m%y').to_i
    @the_squared_date = (@the_date**2)
    @the_date_offset = @the_squared_date.digits[0..3].reverse
    @combined_keys = @key_generator.key_offset.zip(@the_date_offset)
    @final_rotations = @combined_keys.map { |key| key.sum }
  end
end
#lookup file.io

#arg v for using command line in ruby
# input_array = ARGV
# Mike has a tutorial video on ARGV which is pretty good
