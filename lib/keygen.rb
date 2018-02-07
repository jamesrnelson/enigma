require 'pry'
# This key generator randomly creates a 5 digit key and breaks it down into
# four usable numbers by combining the 1st and 2nd digits, the 2nd and 3rd
# digits, the 3rd and 4th digits, and the 4th and 5th digits.
class KeyGen
  attr_reader :key_offset, :key_string
  def initialize(a = 0, b = 9)
    digits = []
    5.times { digits << rand(a..b).to_s }
    @key_offset = []
    until digits.length == 1 do
      @key_offset << (digits.shift + digits.first).to_i
    end
    @key_string = [
      @key_offset[0].to_s[0],
      @key_offset[1].to_s[0],
      @key_offset[2].to_s[0],
      @key_offset[3].to_s[0],
      @key_offset[3].to_s[1]
    ].join
  end
end
