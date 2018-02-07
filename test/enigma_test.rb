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

  # def test_it_exists
  #   assert_instance_of Enigma, @e
  # end
  #
  # def test_input
  #   assert_equal "Hello World", @e.read_input
  # end
  #
  # def test_output
  #   @e.read_input
  #   assert_equal "Hello World", @e.write_output
  # end
  #
  # def test_encrypting_one_letter_with_fixed_rotation
  #   assert_equal ["h"], @e.encrypt("d", [4])
  # end
  #
  # def test_encrypting_two_letters_with_fixed_rotation
  #   assert_equal ["k", "l"], @e.encrypt("hi", [3, 3])
  # end
  #
  # def test_loops_back_to_beggining_of_characters
  #   assert_equal ["h", "e", "l", "l", "o"], @e.encrypt("hello", [39, 39, 39, 39])
  # end
  #
  # def test_looping_with_inputs_at_end_of_characters
  #   assert_equal ["a", "b", "c", "d"], @e.encrypt("9 .,", [82, 82, 82, 82])
  # end
  #
  # def test_rotation_cycles_for_each_letter
  #   assert_equal ["b", "c", "d", "e", "b"], @e.encrypt("aaaaa", [1, 2, 3, 4])
  # end


end
