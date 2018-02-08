require 'pry'

class KeyGen
  attr_reader :key_offset, :key_string
  def initialize(a = 0, b = 0)
    @digit1 = rand(0..9)
    @digit2 = rand(0..9)
    @digit3 = rand(0..9)
    @digit4 = rand(0..9)
    @digit5 = rand(0..9)
    @key_offset = [key_offset_a, key_offset_b, key_offset_c, key_offset_d]
  end

  def key_string
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

  def key_offsets
    @key_offset = [key_offset_a, key_offset_b, key_offset_c, key_offset_d]
  end
end
