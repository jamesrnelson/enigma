require 'Date'
require 'pry'
require './lib/keygen'

class OffsetCalculator
  attr_reader :the_date,
              :the_squared_date,
              :the_date_offset,
              :combined_keys,
              :final_rotations,
              :date_string,
              :key_string

  def initialize(date = Date.today, a = 0, b = 9)
    @key_generator = KeyGen.new(a, b)
    @key_string = @key_generator.key_string
    @date_string = date.strftime('%d%m%y')
    @the_date = date.strftime('%d%m%y').to_i
    @the_squared_date = (@the_date**2)
    @the_date_offset = @the_squared_date.digits[0..3].reverse
    @combined_keys = @key_generator.key_offset.zip(@the_date_offset)
    @final_rotations = @combined_keys.map { |key| key.sum }
  end
end
