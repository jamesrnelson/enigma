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
    assert_equal "h", @e.encrypt("d", 4)
  end

  def test_encrypting_two_letters_with_fixed_rotation
    assert_equal "kl", @e.encrypt("hi", 3)
  end
end
