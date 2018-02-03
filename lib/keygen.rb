# This key generator randomly creates a 5 digit key and breaks it down into
# four usable numbers by combining the 1st and 2nd digits, the 2nd and 3rd
# digits, the 3rd and 4th digits, and the 4th and 5th digits.
class KeyGen
  def initialize
    @digit_1 = rand(0..9)
    @digit_2 = rand(0..9)
    @digit_3 = rand(0..9)
    @digit_4 = rand(0..9)
    @digit_5 = rand(0..9)
  end

  def key
    [@digit_1, @digit_2, @digit_3, @digit_4, @digit_5].join.to_i
  end
end
