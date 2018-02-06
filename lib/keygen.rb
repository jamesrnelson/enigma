require 'pry'
# This key generator randomly creates a 5 digit key and breaks it down into
# four usable numbers by combining the 1st and 2nd digits, the 2nd and 3rd
# digits, the 3rd and 4th digits, and the 4th and 5th digits.
class KeyGen
  attr_reader :key_offset
  def initialize(a = 0, b = 9)
    digits = []
    5.times { digits << rand(a..b).to_s }
    @key_offset = []
    until digits.length == 1 do
      @key_offset << (digits.shift + digits.first).to_i
    end
  end
end

#   def key_offset_a
#     @keys[0]
#   end
#
#   def key_offset_b
#     "#{@digit2}#{@digit3}".to_i
#   end
#
#   def key_offset_c
#     "#{@digit3}#{@digit4}".to_i
#   end
#
#   def key_offset_d
#     "#{@digit4}#{@digit5}".to_i
#   end
# end
