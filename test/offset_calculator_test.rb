require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require 'Date'

SimpleCov.start

class OffsetCalculatorTest < Minitest::Test
  def setup
    @date = Date.today
  end

  def test_offset_calculator_exists
    offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset
  end

  def test_the_creation_of_today_date
    offset = OffsetCalculator.new

    assert_equal '050218', offset.the_date
    assert_equal @date.strftime('%d%m%y'), offset.the_date
  end

  def test_the_date_is_squared
    offset = OffsetCalculator.new

    expected = (@date.strftime('%d%m%y').to_i**2).to_s
    actual = offset.the_squared_date

    assert_equal '2521847524', offset.the_squared_date
    assert_equal expected, actual
  end

  def test_the_date_offset_is_last_four
    offset = OffsetCalculator.new
    squared_date = (@date.strftime('%d%m%y').to_i**2).to_s

    expected = squared_date[-4..-1]
    actual = offset.the_date_offset

    assert_equal '7524', offset.the_date_offset
    assert_equal expected, actual
  end

  def test_date_offset_a
    offset = OffsetCalculator.new

    assert_equal 7, offset.date_offset_a
  end

  def test_date_offset_b
    offset = OffsetCalculator.new

    assert_equal 5, offset.date_offset_b
  end

  def test_date_offset_c
    offset = OffsetCalculator.new

    assert_equal 2, offset.date_offset_c
  end

  def test_date_offset_d
    offset = OffsetCalculator.new

    assert_equal 4, offset.date_offset_d
  end
end
