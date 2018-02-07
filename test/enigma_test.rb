require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/keygen'
require './lib/offset_calculator'
require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new(1, 1)
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_input
    assert_equal "Hello World", @e.read_input
  end

  def test_output
    @e.read_input
    assert_equal "Hello World", @e.write_output
  end

  def test_encrypting_one_letter_with_fixed_rotation
    assert_equal "h", @e.encrypt("d", [4])
  end

  def test_encrypting_two_letters_with_fixed_rotation
    assert_equal "kl", @e.encrypt("hi", [3, 3])
  end

  def test_loops_back_to_beggining_of_characters
    assert_equal "hello", @e.encrypt("hello", [39, 39, 39, 39])
  end

  def test_looping_with_inputs_at_end_of_characters
    assert_equal "abcd", @e.encrypt("9 .,", [82, 82, 82, 82])
  end

  def test_rotation_cycles_for_each_letter
    assert_equal "bcdeb", @e.encrypt("aaaaa", [1, 2, 3, 4])
  end

  def test_decryption_is_encryption_with_operations_reversed
    assert_equal "aaaaa", @e.decrypt("bcdeb", [1, 2, 3, 4])
  end

  def test_manual_key_entry_all
    assert_equal [12, 23, 34, 45], @e.manual_key_entry("12345")
  end

  def test_date_offset
    assert_equal [7, 5, 2, 4], @e.date_offset
  end


end
