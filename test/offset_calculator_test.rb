require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require './lib/keygen'
require 'Date'

SimpleCov.start

class OffsetCalculatorTest < Minitest::Test
  def setup
    date = Date.new(2018, 2, 5)
    @offset = OffsetCalculator.new(date, 1, 1)
  end

  def test_offset_calculator_exists
    assert_instance_of OffsetCalculator, @offset
  end

  def test_the_creation_of_today_date
    assert_equal 50218, @offset.the_date
  end

  def test_the_date_is_squared
    assert_equal 2521847524, @offset.the_squared_date
  end

  def test_date_offset_array
    assert_equal [7, 5, 2, 4], @offset.the_date_offset
  end

  def test_the_keys_combine
    assert_equal [[11, 7], [11,5], [11, 2], [11,4]], @offset.combined_keys
  end

  def test_final_rotation_array
    assert_equal [18, 16, 13, 15], @offset.final_rotations
  end
end
