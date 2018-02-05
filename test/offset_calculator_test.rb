
require 'simplecov'
require 'minitest'
require 'minitest/pride'
require './lib/keygen'
require './lib/offset_calculator'

SimpleCov.start

class OffsetCalculatorTest < Minitest::Test
  def test_offset_calculator_exists
    offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset
  end

  def test_the_creation_of_today_date
    offset = OffsetCalculator.new
    
  end
end
