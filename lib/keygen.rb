require 'pry'

class KeyGen
  attr_reader :key_offset, :key_string
  def initialize(a = 0, b = 9)
    digits = []
    5.times { digits << rand(a..b).to_s }
    @key_offset = []
    @key_integers = @key_offset
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
