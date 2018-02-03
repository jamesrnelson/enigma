# This key generator randomly creates a 5 digit key and breaks it down into
# four usable numbers by combining the 1st and 2nd digits, the 2nd and 3rd
# digits, the 3rd and 4th digits, and the 4th and 5th digits.
class KeyGen
  def initialize
    @digit1 = rand(0..9)
    @digit2 = rand(0..9)
    @digit3 = rand(0..9)
    @digit4 = rand(0..9)
    @digit5 = rand(0..9)
  end

  def key
    [@digit1, @digit2, @digit3, @digit4, @digit5].join
  end

  def key_offset_a
    "#{@digit1}#{@digit2}".to_i
  end

  def key_offset_b
    "#{@digit2}#{@digit3}".to_i
  end

  def key_offset_c
    "#{@digit3}#{@digit4}".to_i
  end

  def key_offset_d
    "#{@digit4}#{@digit5}".to_i
  end
end
