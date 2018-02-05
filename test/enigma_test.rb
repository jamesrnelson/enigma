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

  def test_combine_key_and_date_offset_a
    assert_equal 18, @e.rotation_a
  end

  def test_combine_key_and_date_offset_b
    assert_equal 18, @e.rotation_b
  end

end
