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
end
