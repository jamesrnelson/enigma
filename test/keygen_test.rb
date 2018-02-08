require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require 'pry'

SimpleCov.start

class KeyGenTest < Minitest::Test
  def test_key_gen_exists
    new_key = KeyGen.new

    assert_instance_of KeyGen, new_key
  end

  def test_key_generates_4_offsets_in_array
    new_key = KeyGen.new

    assert_equal 4, new_key.key_offset.length
  end

  def test_key_gen_exists
  new_key = KeyGen.new

  assert_instance_of KeyGen, new_key
end

def test_key_generates_random_5_digit_numbers
  new_key1 = KeyGen.new

  assert_equal 5, new_key1.key_string.length
end

def test_key_offset_a_equals_first_two_digits
  new_key = KeyGen.new

  assert_equal new_key.key_string[0..1].to_i, new_key.key_offset_a
end

def test_key_offset_b_equals_2nd_and_3rd_digits
  new_key = KeyGen.new

  assert_equal new_key.key_string[1..2].to_i, new_key.key_offset_b
end

def test_key_offset_c_equals_3rd_and_4th_digits
  new_key = KeyGen.new

  assert_equal new_key.key_string[2..3].to_i, new_key.key_offset_c
end

def test_key_offset_d_equals_4th_and_5th_digits
  new_key = KeyGen.new

  assert_equal new_key.key_string[3..4].to_i, new_key.key_offset_d
end
end
