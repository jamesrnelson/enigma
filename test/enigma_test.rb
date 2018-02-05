require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test
  def setup
    @e = Enigma.new
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

end
