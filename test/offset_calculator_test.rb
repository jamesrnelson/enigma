
require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'
require 'Date'

SimpleCov.start

class OffsetCalculatorTest < Minitest::Test
  def test_offset_calculator_exists
    offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset
  end

  def test_the_creation_of_today_date
    offset = OffsetCalculator.new
    date = Date.today

    assert_equal "050218", offset.the_date
    assert_equal date.strftime("%d%m%y"), offset.the_date
  end

  def test_the_date_is_squared
    offset = OffsetCalculator.new

    assert_equal "2521847524", offset.the_squared_date
    assert_equal date.strftime("%d%m%y").to_i**2, offset.the_squared_date
  end
end
