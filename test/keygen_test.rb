require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen'
require 'pry'

class KeyGenTest < Minitest::Test
  def test_key_gen_exists
    new_key = KeyGen.new

    assert_instance_of KeyGen, new_key
  end

  def test_key_generates_random_5_digit_numbers
    new_key1 = KeyGen.new
    new_key2 = KeyGen.new
    new_key3 = KeyGen.new
    new_key4 = KeyGen.new
    new_key5 = KeyGen.new
    new_key6 = KeyGen.new
    new_key7 = KeyGen.new
    new_key8 = KeyGen.new
    new_key9 = KeyGen.new
    new_key10 = KeyGen.new
    new_key11 = KeyGen.new
    new_key12 = KeyGen.new
    new_key13 = KeyGen.new
    new_key14 = KeyGen.new
    new_key15 = KeyGen.new
    binding.pry
    assert_equal 5, new_key1.key.length
    assert_equal 5, new_key2.key.length
    assert_equal 5, new_key3.key.length
    assert_equal 5, new_key4.key.length
    assert_equal 5, new_key5.key.length
    assert_equal 5, new_key6.key.length
    assert_equal 5, new_key7.key.length
    assert_equal 5, new_key8.key.length
    assert_equal 5, new_key9.key.length
    assert_equal 5, new_key10.key.length
    assert_equal 5, new_key11.key.length
    assert_equal 5, new_key12.key.length
    assert_equal 5, new_key13.key.length
    assert_equal 5, new_key14.key.length
    assert_equal 5, new_key15.key.length
  end

  def test_key_offset_a_equals_first_two_digits
    new_key = KeyGen.new

    assert_equal new_key.key[0..1].to_i, new_key.key_offset_a
  end

  def test_key_offset_b_equals_2nd_and_3rd_digits
    new_key = KeyGen.new

    assert_equal new_key.key[1..2].to_i, new_key.key_offset_b
  end

  def test_key_offset_c_equals_3rd_and_4th_digits
    new_key = KeyGen.new

    assert_equal new_key.key[2..3].to_i, new_key.key_offset_c
  end

  def test_key_offset_d_equals_4th_and_5th_digits
    new_key = KeyGen.new

    assert_equal new_key.key[3..4].to_i, new_key.key_offset_d
  end
end
