require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
    offset.date
  end






end
